; DMGTRIS
; Copyright (C) 2023 - Randy Thiemann <randy.thiemann@gmail.com>

; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.


IF !DEF(LEVEL_ASM)
DEF LEVEL_ASM EQU 1


INCLUDE "globals.asm"


SECTION "High Level Variables", HRAM
hCurrentDAS:: ds 1
hCurrentARE:: ds 1
hCurrentLineARE:: ds 1
hCurrentLockDelay:: ds 1
hCurrentLineClearDelay:: ds 1
hCurrentIntegerGravity:: ds 1
hCurrentFractionalGravity:: ds 1
hNextSpeedUp:: ds 2
hSpeedCurvePtr:: ds 2
hStartSpeed:: ds 2
hRequiresLineClear:: ds 1
hLevel:: ds 2
hCLevel:: ds 4
hNLevel:: ds 4
hTrueCLevel:: ds 4
hPrevHundreds:: ds 1

SECTION "Level Variables", WRAM0
wBoneActivationLevel: ds 2
wCurrentGarbageThreshold:: ds 1 ; We ran out of HRAM
wInvisActivationLevel: ds 2
wKillScreenActivationLevel: ds 2
wKillScreenActivationLevelBCD: ds 2
wLastLockLevel: ds 2
wStaffRollDuration:: ds 2
wBigStaffRoll:: ds 1
wBonesActive:: ds 1
wInvisActive:: ds 1
wKillScreenActive:: ds 1
wLockLevel:: ds 1
wShouldGoStaffRoll:: ds 1
wNoMoreLocks:: ds 1
wSkippedSectionsBCD:: ds 1


SECTION "Level Functions", ROM0
    ; Loads the initial state of the speed curve.
LevelInit::
    ; Bank to speed curve data.
    ld b, BANK_OTHER
    rst RSTSwitchBank

    xor a, a
    ld [wCurrentGarbageActivation], a
    ldh [hRequiresLineClear], a
    ld [wBonesActive], a
    ld [wInvisActive], a
    ld [wKillScreenActive], a
    ld [wLockLevel], a
    ld [wShouldGoStaffRoll], a
    ld [wNoMoreLocks], a
    ld [wSkippedSectionsBCD], a


    ldh a, [hStartSpeed]
    ld l, a
    ldh a, [hStartSpeed+1]
    ld h, a

    ; CLevel
    ld a, [hl+]
    ld b, a
    and a, $0F
    ldh [hCLevel+3], a
    ldh [hTrueCLevel+3], a
    ld a, b
    swap a
    and a, $0F
    ldh [hCLevel+2], a
    ldh [hTrueCLevel+2], a
    ld a, [hl+]
    ld b, a
    and a, $0F
    ldh [hCLevel+1], a
    ldh [hTrueCLevel+1], a
    ld a, b
    swap a
    and a, $0F
    ldh [hCLevel], a
    ldh [hTrueCLevel], a

    ld a, l
    ldh [hSpeedCurvePtr], a
    ld a, h
    ldh [hSpeedCurvePtr+1], a

    ; Binary level.
    ld a, [hl+]
    ldh [hLevel], a
    ld a, [hl+]
    ldh [hLevel+1], a

    ; NLevel
    ld a, [hl+]
    ld b, a
    and a, $0F
    ldh [hNLevel+3], a
    ld a, b
    swap a
    and a, $0F
    ldh [hNLevel+2], a
    ld a, [hl+]
    ld b, a
    and a, $0F
    ldh [hNLevel+1], a
    ld a, b
    swap a
    and a, $0F
    ldh [hNLevel], a

    ; Get special data.
    call SpecialLevelInit

    ; Restore the bank to keep the stack balanced.
    rst RSTRestoreBank

    ; Get the speed curve
    jp AdjustSpeedCurveForced


SpecialLevelInit:
    ld a, [wSpeedCurveState]
    ld b, a
    add a, b
    add a, b
    ld b, 0
    ld c, a
    ld hl, .jumps
    add hl, bc
    jp hl

.jumps
    jp .dmgt
    jp .tgm1
    jp .tgm3
    jp .deat
    jp .shir
    jp .chil
    jp .myco
    jp .shrt

.dmgt
    ld hl, sDMGTSpeedCurveSpecialData
    jr .loaddata

.tgm1
    ld hl, sTGM1SpeedCurveSpecialData
    jr .loaddata

.tgm3
    ld hl, sTGM3SpeedCurveSpecialData
    jr .loaddata

.deat
    ld hl, sDEATSpeedCurveSpecialData
    jr .loaddata

.shir
    ld hl, sSHIRSpeedCurveSpecialData
    jr .loaddata

.chil
    ld hl, sCHILSpeedCurveSpecialData
    jr .loaddata

.myco
    ld hl, sMYCOSpeedCurveSpecialData
    jr .loaddata
.shrt
    ld hl, sSHRTSpeedCurveSpecialData
    jr .loaddata

.loaddata
    ld a, [hl+]
    ld [wBoneActivationLevel], a
    ld a, [hl+]
    ld [wBoneActivationLevel+1], a
    ld a, [hl+]
    ld [wInvisActivationLevel], a
    ld a, [hl+]
    ld [wInvisActivationLevel+1], a
    ld a, [hl+]
    ld [wKillScreenActivationLevel], a
    ld a, [hl+]
    ld [wKillScreenActivationLevel+1], a
    ld a, [hl+]
    ld [wKillScreenActivationLevelBCD], a
    ld a, [hl+]
    ld [wKillScreenActivationLevelBCD+1], a
    ld a, [hl+]
    ld [wLastLockLevel], a
    ld a, [hl+]
    ld [wLastLockLevel+1], a
    ld a, [hl+]
    ld [wStaffRollDuration], a
    ld a, [hl+]
    ld [wStaffRollDuration+1], a
    ld a, [hl]
    ld [wBigStaffRoll], a
    ret


    ; Increment level and speed up if necessary. Level increment in E.
    ; Levels may only increment by single digits.
LevelUp::
    ; Return if our level is hard locked.
    ld a, [wLockLevel]
    cp a, $FF
    ret z

    ; Return if we're maxed out.
    ld hl, hCLevel
    ld a, $09
    and a, [hl]
    inc hl
    and a, [hl]
    inc hl
    and a, [hl]
    inc hl
    and a, [hl]
    ld c, [hl]
    cp a, $09
    ret z

    ; Binary addition
    ldh a, [hLevel]
    ld l, a
    ldh a, [hLevel+1]
    ld h, a
    ld a, e
    add a, l
    ld l, a
    adc a, h
    sub a, l
    ldh [hLevel+1], a
    ld a, l
    ldh [hLevel], a

    ; Save the current hundred digit.
    ldh a, [hCLevel+1]
    ldh [hPrevHundreds], a

    ; Increment LSD.
.doit
    ld hl, hCLevel+3
    ld a, [hl]
    add a, e
    ld [hl], a
    cp a, $0A
    jr c, .checknlevel
    sub a, 10
    ld [hl], a

    ; Carry the one...
    dec hl
    ld a, [hl]
    inc a
    ld [hl], a
    cp a, $0A
    jr c, .checknlevel
    xor a, a
    ld [hl], a

    ; Again...
    dec hl
    ld a, [hl]
    inc a
    ld [hl], a
    cp a, $0A
    jr c, .checknlevel
    xor a, a
    ld [hl], a

    ; Once more...
    dec hl
    ld a, [hl]
    inc a
    ld [hl], a
    cp a, $0A
    jr c, .checknlevel

    ; We're maxed out. Both levels should be set to 9999.
    ld a, 9
    ldh [hCLevel], a
    ldh [hCLevel+1], a
    ldh [hCLevel+2], a
    ldh [hCLevel+3], a
    ld hl, 9999
    ld a, l
    ldh [hLevel], a
    ld a, h
    ldh [hLevel+1], a
    jp AdjustSpeedCurve

.checknlevel
    ; Check if we are on the SHRT speed curve, since it has a different nlevel processing
    ld a, [wSpeedCurveState]
    cp a, SCURVE_SHRT
    jp z, .shrt
    ; Make wNLevel make sense.
    ld hl, hCLevel
    ld a, $09
    and a, [hl]
    inc hl
    and a, [hl]
    cp a, $09
    ; If wCLevel begins 99, wNLevel should be 9999.
    jr nz, :+
    ld a, 9
    ldh [hNLevel], a
    ldh [hNLevel+1], a
    ldh [hNLevel+2], a
    ldh [hNLevel+3], a
    ; If the last two digits of wCLevel are 98, play the bell.
    ld hl, hCLevel+2
    ld a, [hl+]
    cp a, 9
    jp nz, AdjustSpeedCurve
    ld a, [hl]
    cp a, 8
    jp nz, AdjustSpeedCurve
    ld a, $FF
    ldh [hRequiresLineClear], a
    call SFXKill
    ld a, SFX_LEVELLOCK
    call SFXEnqueue
    jp .leveljinglemaybe

    ; Otherwise check the second digit of wCLevel.
:   ld hl, hCLevel+1
    ld a, [hl]
    ; If it's 9, wNLevel should be y0xx. With y being the first digit of wCLevel+1
    cp a, 9
    jr nz, :+
    ld hl, hNLevel+1
    xor a, a
    ld [hl], a
    ld hl, hCLevel
    ld a, [hl]
    inc a
    ld hl, hNLevel
    ld [hl], a
    jp .bellmaybe

    ; Otherwise just set the second digit of wNLevel to the second digit of wCLevel + 1.
:   ld hl, hCLevel+1
    ld a, [hl]
    inc a
    ld hl, hNLevel+1
    ld [hl], a
    jp .checkcool
.shrt
    ; Make wNLevel make sense.
    ld hl, hCLevel
    ld a, $09
    and a, [hl]
    inc hl
    and a, [hl]
    cp a, $09
    ; If wCLevel begins 99, wNLevel should be 9999.
    jr nz, :+
    ld a, 9
    ldh [hNLevel], a
    ldh [hNLevel+1], a
    ldh [hNLevel+2], a
    ldh [hNLevel+3], a
    ; If the last two digits of wCLevel are one less than hNlevel, play the bell.
    ld de, hNLevel+2
    ld a, [de]
    inc de
    swap a
    ld b, a
    ld a, [de]
    dec a
    or b
    ld a, b ; Make sure that the result doesn't contain Hexadecimal digits
    and a, $0f
    cp a, $0F
    sub a, 6 ; Skip $F, $E, $D, $C, $B and $A
    ld b, a
    ld hl, hCLevel+2
    ld a, [hl+]
    swap a
    or a, [hl]
    cp a, b
    jp nz, AdjustSpeedCurve
    ld a, $FF
    ldh [hRequiresLineClear], a
    call SFXKill
    ld a, SFX_LEVELLOCK
    call SFXEnqueue
    jp .leveljinglemaybe
    ; Otherwise check the second digit of wCLevel.
:   ld hl, hCLevel+1
    ld a, [hl]
    ; If it's 9, wNLevel should be y0xx. With y being the first digit of wCLevel+1
    cp a, 9
    jr nz, :+
    ld hl, hNLevel+1
    xor a, a
    ld [hl], a
    ld hl, hCLevel
    ld a, [hl]
    inc a
    ld hl, hNLevel
    ld [hl], a
    jp .bellmaybe

    ; Otherwise set wNLevel to the next speed increase if the second hClevel digit isn't 1
:   ; For it to be always correct, first adjust the speed curve if needed
    call AdjustSpeedCurve
    ld hl, hCLevel+1
    ld a, [hl]
    cp a, 1
    jr nc, :+

    ldh a, [hSpeedCurvePtr]
    ld l, a
    ldh a, [hSpeedCurvePtr+1]
    ld h, a
    ; we need to go back 2 bytes
    dec hl
    dec hl
    ; Bank to speed curve data.
    ld b, BANK_OTHER
    rst RSTSwitchBank
    ld a, [hl+]
    ld b, a
    and a, $0F
    ldh [hNLevel+3], a
    ld a, b
    swap a
    and a, $0F
    ldh [hNLevel+2], a
    ld a, [hl+]
    ld b, a
    and a, $0F
    ldh [hNLevel+1], a
    ld a, b
    swap a
    and a, $0F
    ldh [hNLevel], a
    rst RSTRestoreBank
    jp .bellmaybe
    ; Or set the second hNLevel digit to the second hCLevel digit +1 if it is 1 or greater
:   ld hl, hCLevel+1
    ld a, [hl]
    inc a
    ld hl, hNLevel+1
    ld [hl], a
    ; Check for regrets or cools
    ; Make sure we are at level *70-*78 and that we didn't check for the cool already
.checkcool
    ld a, [wSpeedCurveState]
    cp a, SCURVE_TGM3
    jp nz, .bellmaybe

    ld a, [wCOOLIsActive]
    cp a, 1
    jr z, .checkregret
    ld a, [hCLevel+CLEVEL_TENS]
    cp a, 7
    jr nz, .checkregret
    ld a, [hCLevel+CLEVEL_ONES]
    cp a, 9
    call c, TGM3COOLHandler
    cp a, 1
    jp z, .bellmaybe

.checkregret
    ; Make sure we are at level *00-*05 and that we haven't checked already. Reset the section timer, too.
    ld a, [wREGRETChecked]
    cp a, 1
    jp z, .bellmaybe
    ld a, [hCLevel+CLEVEL_TENS]
    cp a, 0
    jr nz, .regretavailable
    ld a, [hCLevel+CLEVEL_ONES]
    cp a, 6
    call c, TGM3REGRETHandler
    ld a, [wSectionTimerReset]
    cp a, 1
    jr z, .bellmaybe

.resetsectiontimer
    ld a, [hCLevel+CLEVEL_HUNDREDS]
    ld b, a
    ld a, [hCLevel+CLEVEL_THOUSANDS]
    swap a
    or b
    cp a, $00
    jr z, .regretavailable
    ld a, [hCLevel+CLEVEL_TENS]
    cp a, 0
    jr nz, .regretavailable
    xor a, a
    ld [wSectionMinutes], a
    ld [wSectionSeconds], a
    ld [wSectionFrames], a
    inc a
    ld [wSectionTimerReset], a

.regretavailable
    xor a, a
    ld [wREGRETChecked], a

.bellmaybe
    ; If the last two digits of wCLevel are 99, play the bell.
    ld hl, hCLevel+2
    ld a, [hl+]
    and a, [hl]
    cp a, 9
    jr nz, .leveljinglemaybe
    ld a, [wNoMoreLocks]
    cp a, $FF
    jr z, AdjustSpeedCurve
    ld a, $FF
    ldh [hRequiresLineClear], a
    call SFXKill
    ld a, SFX_LEVELLOCK
    call SFXEnqueue

.leveljinglemaybe
    ldh a, [hPrevHundreds]
    ld b, a
    ldh a, [hCLevel+1]
    cp a, b
    jr z, AdjustSpeedCurve
    call SFXKill
    ld a, SFX_LEVELUP
    call SFXEnqueue
    ; This falls through to AdjustSpeedCurve, this is intended.


AdjustSpeedCurve:
    call BuildTrueCLevel
    call CheckSpecialLevelConditions

.docheck
.checkthousands
    ; Get the thousands level of the next speed up.
    ldh a, [hNextSpeedUp]
    swap a
    and a, $0F

    ; Compare to ours.
    ld hl, hTrueCLevel+CLEVEL_THOUSANDS
    cp a, [hl]
    jr z, .checkhundreds ; Equal? We need to check deeper.
    jr c, AdjustSpeedCurveForced    ; Ours higher? We need to increase.
    ret                  ; Ours lower? We're done.

.checkhundreds
    ; Get the hundreds level of the next speed up.
    ldh a, [hNextSpeedUp]
    and a, $0F

    ; Compare to ours.
    ld hl, hTrueCLevel+CLEVEL_HUNDREDS
    cp a, [hl]
    jr z, .checktens     ; Equal? We need to check deeper.
    jr c, AdjustSpeedCurveForced    ; Ours higher? We need to increase.
    ret                  ; Ours lower? We're done.

.checktens
    ; Get the tens level of the next speed up.
    ldh a, [hNextSpeedUp+1]
    swap a
    and a, $0F

    ; Compare to ours.
    ld hl, hTrueCLevel+CLEVEL_TENS
    cp a, [hl]
    jr z, .checkones     ; Equal? We need to check deeper.
    jr c, AdjustSpeedCurveForced    ; Ours higher? We need to increase.
    ret                  ; Ours lower? We're done.

.checkones
    ; Get the ones level of the next speed up.
    ldh a, [hNextSpeedUp+1]
    and a, $0F

    ; Compare to ours.
    ld hl, hTrueCLevel+CLEVEL_ONES
    cp a, [hl]
    jr c, AdjustSpeedCurveForced    ; Ours higher? We need to increase.
    ret nz               ; Ours lower? We're done.
                         ; Equal? We need to increase.


AdjustSpeedCurveForced:
    ; Update all data to the next speed curve data.
    ; Bank to speed curve data.
    ld b, BANK_OTHER
    rst RSTSwitchBank

    ; Load curve ptr.
    ldh a, [hSpeedCurvePtr]

    ld l, a
    ldh a, [hSpeedCurvePtr+1]
    ld h, a

    ; There's 4 bytes we don't care about.
    inc hl
    inc hl
    inc hl
    inc hl

    ; Get all the new data.
    ld a, [hl+]
    ldh [hCurrentIntegerGravity], a
    ld a, [hl+]
    ldh [hCurrentFractionalGravity], a
    ld a, [hl+]
    ldh [hCurrentARE], a
    ld a, [hl+]
    ldh [hCurrentLineARE], a
    ld a, [hl+]
    ldh [hCurrentDAS], a
    ld a, [hl+]
    ldh [hCurrentLockDelay], a
    ld a, [hl+]
    ldh [hCurrentLineClearDelay], a
    ld a, [hl+]
    ld [wCurrentGarbageThreshold], a
    ld a, [hl+]
    ldh [hNextSpeedUp+1], a
    ld a, [hl+]
    ldh [hNextSpeedUp], a

    ; Save the new pointer.
    ld a, l
    ldh [hSpeedCurvePtr], a
    ld a, h
    ldh [hSpeedCurvePtr+1], a

    ; Do we want to force 20G?
    ld a, [wAlways20GState]
    or a, a
    jr z, .continue
    ld a, 20
    ldh [hCurrentIntegerGravity], a
    xor a, a
    ldh [hCurrentFractionalGravity], a

.continue
    call RSTRestoreBank

    ; Jump back, we may need to increase more than once.
    jr AdjustSpeedCurve.docheck


    ; Builds an internal level that is the displayed level skipped an amount of sections ahead.
BuildTrueCLevel:
    ld hl, hCLevel
    ld a, [hl+]
    ldh [hTrueCLevel], a
    ld a, [hl+]
    ldh [hTrueCLevel+1], a
    ld a, [hl+]
    ldh [hTrueCLevel+2], a
    ld a, [hl]
    ldh [hTrueCLevel+3], a

    ; Except in TGM3 mode, this will always just be the same as the real level, so check for the most common case and bail.
    ld a, [wSkippedSectionsBCD]
    or a, a
    ret z

    ; Otherwise, to the thing.
    ; Amount of steps to increment hundreds.
    ld a, [wSkippedSectionsBCD]
    and a, $0F
    ld b, a

    ; Increase hundreds
    ldh a, [hTrueCLevel+CLEVEL_HUNDREDS]
    add a, b
    ldh [hTrueCLevel+CLEVEL_HUNDREDS], a

    ; Is hundreds overflowing?
    cp a, $0A
    jr c, .thousands

    ; Yes, it was, so decrease by 10, and increment thousands.
    sub a, 10
    ldh [hTrueCLevel+CLEVEL_HUNDREDS], a
    ld hl, hTrueCLevel+CLEVEL_THOUSANDS
    inc [hl]

.thousands
    ; Amount of steps to increment thousands.
    ld a, [wSkippedSectionsBCD]
    swap a
    and a, $0F
    ld b, a

    ; Increase thousands
    ldh a, [hTrueCLevel+CLEVEL_THOUSANDS]
    add a, b
    ldh [hTrueCLevel+CLEVEL_THOUSANDS], a

    ; This may cause a nonsense number. Fix it if that happens.
    cp a, $0A
    ret c
    ld a, $09
    ldh [hTrueCLevel+CLEVEL_THOUSANDS], a
    ret




CheckSpecialLevelConditions:
    ; Is our nlevel > our kill screen?
    ld hl, wKillScreenActivationLevelBCD+1
    ld a, [hl]
    swap a
    and a, $0F
    ld b, a
    ldh a, [hNLevel]
    cp a, b
    jr c, .nooverride
    jr nz, .override
    ld a, [hl-]
    and a, $0F
    ld b, a
    ldh a, [hNLevel+1]
    cp a, b
    jr c, .nooverride
    jr nz, .override
    ld a, [hl]
    swap a
    and a, $0F
    ld b, a
    ldh a, [hNLevel+2]
    cp a, b
    jr c, .nooverride
    jr nz, .override
    ld a, [hl]
    and a, $0F
    ld b, a
    ldh a, [hNLevel+3]
    cp a, b
    jr c, .nooverride

.override
    ld hl, wKillScreenActivationLevelBCD
    ld a, [hl]
    and a, $0F
    ldh [hNLevel+3], a
    ld a, [hl+]
    swap a
    and a, $0F
    ldh [hNLevel+2], a
    ld a, [hl]
    and a, $0F
    ldh [hNLevel+1], a
    ld a, [hl]
    swap a
    and a, $0F
    ldh [hNLevel], a

    ; Get our level in bc
.nooverride
    ldh a, [hLevel]
    ld c, a
    ldh a, [hLevel+1]
    ld b, a

    ; Do we need to do a special lock?
.speciallock
    ld hl, wLastLockLevel
    ld a, [hl+]
    cp a, $FF ; $FF means never.
    jp z, .bones

    ; Load the level, binary in de.
    ld e, a
    ld d, [hl]

    ; Check if BC == DE...
    ld a, b
    cp a, d
    jr nz, .bones
    ld a, c
    cp a, e
    jr nz, .bones

    ; Jingle and level lock.
    ld a, $FF
    ldh [hRequiresLineClear], a
    ld [wNoMoreLocks], a
    push bc
    call SFXKill
    ld a, SFX_LEVELLOCK
    call SFXEnqueue
    pop bc

    ; Bones?
.bones
    ld hl, wBoneActivationLevel
    ld a, [hl+]
    cp a, $FF ; $FF means never.
    jp z, .invis

    ; Load the level, binary in de.
    ld e, a
    ld d, [hl]

    ; Check if BC >= DE...
    ; Skip if B < D.
    ld a, b
    cp a, d
    jr c, .invis

    ; We can confidently enter the bone zone if B > D.
    jr nz, .enterthebonezone

    ; If B == D, we need to check C and E...

    ; Skip if C < E. Otherwise enter the bone zone.
    ld a, c
    cp a, e
    jr c, .invis

.enterthebonezone
    ld a, $FF
    ld [wBonesActive], a

    ; Invis?
.invis
    ld hl, wInvisActivationLevel
    ld a, [hl+]
    cp a, $FF ; $FF means never.
    jp z, .killscreen

    ; Load the level, binary in de.
    ld e, a
    ld d, [hl]

    ; Check if BC >= DE...
    ; Skip if B < D.
    ld a, b
    cp a, d
    jr c, .killscreen

    ; We can confidently vanish if B > D.
    jr nz, .vanishoxyaction

    ; If B == D, we need to check C and E...

    ; Skip if C < E. Otherwise vanish.
    ld a, c
    cp a, e
    jr c, .killscreen

.vanishoxyaction
    ld a, $FF
    ld [wInvisActive], a

    ; Kill screen?
.killscreen
    ld hl, wKillScreenActivationLevel
    ld a, [hl+]
    cp a, $FF
    ret z

    ; Load the level, binary in de.
    ld e, a
    ld d, [hl]

    ; Check if BC >= DE...
    ; Ret if B < D.
    ld a, b
    cp a, d
    ret c

    ; We can confidently rip if B > D.
    jr nz, .rip

    ; If B == D, we need to check C and E...

    ; Skip if C < E. Otherwise rip.
    ld a, c
    cp a, e
    ret c

.rip
    call SFXKill

    ld a, $FF
    ld [wKillScreenActive], a

    ld hl, wKillScreenActivationLevelBCD
    ld a, [hl]
    and a, $0F
    ldh [hCLevel+3], a
    ldh [hNLevel+3], a
    ld a, [hl+]
    swap a
    and a, $0F
    ldh [hCLevel+2], a
    ldh [hNLevel+2], a
    ld a, [hl]
    and a, $0F
    ldh [hCLevel+1], a
    ldh [hNLevel+1], a
    ld a, [hl]
    swap a
    and a, $0F
    ldh [hCLevel], a
    ldh [hNLevel], a
    ld a, $FF
    ld [wLockLevel], a

    ; Since we triggered a kill screen, does this mean the game now just ends, or do we transition to the staff roll?
.staffroll
    ld hl, wStaffRollDuration
    ld a, [hl+]
    cp a, $FF
    jr z, .justkill

    ; Yes, tell the game that we should go to staff roll instead.
    ld a, $FF
    ld [wShouldGoStaffRoll], a
    ret

.justkill
    ld a, 1
    ldh [hCurrentARE], a
    ldh [hCurrentLineARE], a
    ldh [hCurrentDAS], a
    ldh [hCurrentLockDelay], a
    ldh [hCurrentLineClearDelay], a

    ld a, 20
    ldh [hCurrentIntegerGravity], a

    xor a, a
    ldh [hCurrentFractionalGravity], a
    ret


TriggerKillScreen::
    call SFXKill
    ld a, 1
    ldh [hCurrentARE], a
    ldh [hCurrentLineARE], a
    ldh [hCurrentDAS], a
    ldh [hCurrentLockDelay], a
    ldh [hCurrentLineClearDelay], a

    ld a, 20
    ldh [hCurrentIntegerGravity], a

    xor a, a
    ldh [hCurrentFractionalGravity], a
    ld [wKillScreenActivationLevel], a
    ld [wKillScreenActivationLevel+1], a

    ld a, $FF
    ld [wKillScreenActive], a
    ret


    ; Gets a 0-indexed section number, returned in A as binary.
    ; Levels 0000-0099 would return 0, levels 0100-0199 would return 1, ... levels 9900-9999 would return 99.
GetSection::
    ; Load thousands.
    ldh a, [hCLevel+CLEVEL_THOUSANDS]

    ; Multiply by 10, which is equal to multiply by 8 + multiply by 2
    ld b, a
    sla b
    add a, a
    add a, a
    add a, a
    add a, b

    ; Add hundreds.
    ld hl, hCLevel+CLEVEL_HUNDREDS
    add a, [hl]
    ret


    ; Gets the current section, but as BCD in A.
GetSectionBCD::
    ldh a, [hCLevel+CLEVEL_THOUSANDS]
    swap a
    ld hl, hCLevel+CLEVEL_HUNDREDS
    or a, [hl]
    ret


    ; Gets a 0-indexed section number, returned in A as binary.
    ; Levels 0000-0099 would return 0, levels 0100-0199 would return 1, ... levels 9900-9999 would return 99.
    ; This version calculates the amount of skipped sections in.
GetAdjustedSection::
    ; Load thousands.
    ldh a, [hTrueCLevel+CLEVEL_THOUSANDS]

    ; Multiply by 10, which is equal to multiply by 8 + multiply by 2
    ld b, a
    sla b
    add a, a
    add a, a
    add a, a
    add a, b

    ; Add hundreds.
    ld hl, hTrueCLevel+CLEVEL_HUNDREDS
    add a, [hl]
    ret


    ; Gets the current section, but as BCD in A.
    ; This version calculates the amount of skipped sections in.
GetAdjustedSectionBCD::
    ldh a, [hTrueCLevel+CLEVEL_THOUSANDS]
    swap a
    ld hl, hTrueCLevel+CLEVEL_HUNDREDS
    or a, [hl]
    ret


    ; Will skip the virtual level forward by 100 levels.
    ; This will NOT affect the displayed level, nor will it affect scoring.
    ; It will only make it so the internal speed pointer will be ahead by N*100 levels.
SkipSection::
    ld a, [wSkippedSectionsBCD]
    add a, $01
    daa ; Yes, this is the rare case where this instruction is useful!
    ld [wSkippedSectionsBCD], a
    jp AdjustSpeedCurve

ENDC
