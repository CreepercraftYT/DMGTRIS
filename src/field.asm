IF !DEF(FIELD_ASM)
DEF FIELD_ASM EQU 1


INCLUDE "globals.asm"


SECTION "Field Variables", WRAM0
wField:: ds (10*24)
wShadowField:: ds (14*26)


SECTION "Field High Variables", HRAM
hToppedOut:: ds 1
hPieceDataBase:: ds 2
hPieceDataOffset:: ds 1
hCurrentLockDelayRemaining:: ds 1
hTicksUntilG:: ds 1
hWantX:: ds 1
hWantRotation:: ds 1


SECTION "Field Functions", ROM0
FieldInit::
    ld hl, wField
    ld bc, 10*24
    ld d, 1
    call UnsafeMemSet
    ld hl, wShadowField
    ld bc, 14*26
    ld d, $FF
    call UnsafeMemSet
    ret


FieldClear::
    ld hl, wField
    ld bc, 10*24
    ld d, TILE_FIELD_EMPTY
    call UnsafeMemSet
    ret


ToShadowField:
    ld hl, wField
    ld de, wShadowField+2
    ld c, 24
.outer
    ld b, 10
.inner
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .inner
    inc de
    inc de
    inc de
    inc de
    dec c
    jr nz, .outer
    ret


FromShadowField:
    ld hl, wField
    ld de, wShadowField+2
    ld c, 24
.outer
    ld b, 10
.inner
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, .inner
    inc de
    inc de
    inc de
    inc de
    dec c
    jr nz, .outer
    ret


    ; This routine will copy wField onto the screen.
BlitField::
    ; What to copy
    ld de, wField + 40
    ; Where to put it
    ld hl, FIELD_TOP_LEFT
    ; How much to increment hl after each row
    ld bc, 32-10

    ; The first 14 rows can be blitted without checking for vram access.
    REPT 14
        REPT 10
            ld a, [de]
            ld [hl+], a
            inc de
        ENDR
        add hl, bc
    ENDR

:   ldh a, [rLY]
    cp a, 0
    jr nz, :-

    ; The last 6 rows need some care.
    REPT 6
        ; Wait until start of drawing, then insert 35 nops.
:       ldh a, [rSTAT]
        and a, 3
        cp a, 3
        jr nz, :-
        REPT 35
            nop
        ENDR

        ; Blit a line.
        REPT 10
            ld a, [de]
            ld [hl+], a
            inc de
        ENDR

        ; Increment HL so that the next line can be blitted.
        add hl, bc
    ENDR

    ; This has to finish just before the first LCDC interrupt of the frame or stuff will break in weird ways.
    jp EventLoop


SetPieceData:
    ldh a, [hCurrentPiece]
    ld hl, sPieceRotationStates
    ld de, 16
:   cp a, 0
    jr z, :+
    add hl, de
    dec a
    jr :-
:   ld a, l
    ldh [hPieceDataBase], a
    ld a, h
    ldh [hPieceDataBase+1], a
    ret


SetPieceDataOffset:
    ldh a, [hCurrentPieceRotationState]
    rlc a
    rlc a
    ldh [hPieceDataOffset], a
    ret


    ; Converts piece Y in B and a piece X in A to a pointer to the shadow field in HL.
XYToSFieldPtr:
    ld hl, wShadowField
    ld de, 14
    inc a
    inc b
:   dec b
    jr z, :+
    add hl, de
    jr :-
:   dec a
    ret z
    inc hl
    jr :-
    ret



    ; Converts piece Y in B and a piece X in A to a pointer to the field in HL.
XYToFieldPtr:
    ld hl, wField-2
    ld de, 10
    inc a
    inc b
:   dec b
    jr z, :+
    add hl, de
    jr :-
:   dec a
    ret z
    inc hl
    jr :-
    ret


GetPieceData:
    ldh a, [hPieceDataBase]
    ld l, a
    ldh a, [hPieceDataBase+1]
    ld h, a
    ldh a, [hPieceDataOffset]
    ld c, a
    xor a, a
    ld b, a
    add hl, bc
    ret

    ; Checks if the piece can fit at the current position.
    ; HL should point to the piece's rotation state data.
    ; DE should be pointing to the right place in the SHADOW field.
CanPieceFit:
    xor a, a
    ld b, a

    ; Row 1
    bit 3, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 2, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 1, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 0, [hl]
    jr z, .r1end
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz

.r1end
    REPT 11
        inc de
    ENDR

    ; Row 2
    inc hl
    bit 3, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 2, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 1, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 0, [hl]
    jr z, .r2end
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz

.r2end
    REPT 11
        inc de
    ENDR

    ; Row 3
    inc hl
    bit 3, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 2, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 1, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 0, [hl]
    jr z, .r3end
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ret nz

.r3end
    REPT 11
        inc de
    ENDR

    ; Row 4
    inc hl
    bit 3, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 2, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 1, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz
:   inc de
    inc b
    bit 0, [hl]
    jr z, :+
    ld a, [de]
    cp a, TILE_FIELD_EMPTY
    ld a, b
    ret nz

    ; If we got here, the piece can fit.
:   ld a, $FF
    ret


TrySpawnPiece::
    ldh a, [hCurrentFramesPerGravityTick]
    ldh [hTicksUntilG], a

    ; Copy the field to the shadow field.
    call ToShadowField

    ; Assume we're not topped out.
    xor a, a
    ldh [hToppedOut], a

    ; Point the piece data to the correct piece.
    call SetPieceData
    call SetPieceDataOffset

    ; Get the piece's spawn position.
    ldh a, [hCurrentPieceY]
    ld b, a
    ldh a, [hCurrentPieceX]
    call XYToSFieldPtr

    ; Check if the piece can spawn.
    ld d, h
    ld e, l
    call GetPieceData
    jp CanPieceFit
    ; A will be $FF if the piece can fit.
    ; We jump instead of return to save a few cycles.


    ; Draws the piece onto the field.
    ; B is the tile.
    ; DE should point to the piece's rotation state data.
    ; HL should be pointing to the right place in the NORMAL field.
DrawPiece:
    ld a, [de]
    inc de

    bit 3, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 2, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 1, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 0, a
    jr z, .r1end2
    ld [hl], b

.r1end2
    REPT 7
        inc hl
    ENDR
    ld a, [de]
    inc de

    bit 3, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 2, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 1, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 0, a
    jr z, .r2end2
    ld [hl], b

.r2end2
    REPT 7
        inc hl
    ENDR
    ld a, [de]
    inc de

    bit 3, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 2, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 1, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 0, a
    jr z, .r3end2
    ld [hl], b

.r3end2
    REPT 7
        inc hl
    ENDR
    ld a, [de]
    inc de

    bit 3, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 2, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 1, a
    jr z, :+
    ld [hl], b
:   inc hl
    bit 0, a
    ret z
    ld [hl], b
    ret


FieldProcess::
    ; Wipe out the piece.
    ldh a, [hCurrentPieceY]
    ld b, a
    ldh a, [hCurrentPieceX]
    call XYToFieldPtr
    ld d, h
    ld e, l
    call GetPieceData
    ld b, TILE_FIELD_EMPTY
    push hl
    push de
    pop hl
    pop de
    call DrawPiece

    ; Gravity?
    ldh a, [hTicksUntilG]
    dec a
    ldh [hTicksUntilG], a
    jr nz, .nograv
    ldh a, [hCurrentFramesPerGravityTick]
    ldh [hTicksUntilG], a

    ; Move the piece down, but first check if there's still sufficient "down" to go.
    ldh a, [hCurrentGravityPerTick]
    ld b, a
:   ldh a, [hCurrentPieceY]
    add a, b
    cp a, 22
    jr c, :+
    dec b
    jr z, .nograv
    jr :-
:   push bc
    ldh a, [hCurrentPieceY]
    add a, b
    ld b, a
    ldh a, [hCurrentPieceX]
    call XYToSFieldPtr
    ld d, h
    ld e, l
    call GetPieceData
    call CanPieceFit
    cp a, $FF
    jr z, .dolower
    pop bc
    dec b
    jr z, .nograv
    jr :-

.dolower
    pop bc
    ldh a, [hCurrentPieceY]
    add a, b
    ldh [hCurrentPieceY], a

.nograv
    ldh a, [hCurrentPieceX]
    ldh [hWantX], a
    ldh a, [hCurrentPieceRotationState]
    ldh [hWantRotation], a

    ; Want left?
.wantleft
    ldh a, [hLeftState]
    cp a, 1
    jr z, :+
    ld b, a
    ldh a, [hCurrentDAS]
    ld c, a
    ld a, b
    cp a, c
    jr c, .wantright
:   ldh a, [hWantX]
    dec a
    ldh [hWantX], a

    ; Want right?
.wantright
    ldh a, [hRightState]
    cp a, 1
    jr z, :+
    ld b, a
    ldh a, [hCurrentDAS]
    ld c, a
    ld a, b
    cp a, c
    jr c, .wantrotccw
:   ldh a, [hWantX]
    inc a
    ldh [hWantX], a

    ; Want rotate CCW?
.wantrotccw
    ldh a, [hAState]
    cp a, 1
    jr nz, .wantrotcw
    ldh a, [hWantRotation]
    inc a
    and a, $03
    ldh [hWantRotation], a


    ; Want rotate CW?
.wantrotcw
    ldh a, [hBState]
    cp a, 1
    jr nz, .moverotrequested
    ldh a, [hWantRotation]
    dec a
    and a, $03
    ldh [hWantRotation], a


    ; Do we need to try to move/rotate the piece?
.moverotrequested
    ldh a, [hWantRotation]
    ld b, a
    ldh a, [hCurrentPieceRotationState]
    cp a, b
    jr nz, .trymoverot ; Move and rotate.
    ldh a, [hWantX]
    ld b, a
    ldh a, [hCurrentPieceX]
    cp a, b
    jr z, .postmove ; Neither move nor rotate.

    ; Move only.
    ldh a, [hCurrentPieceY]
    ld b, a
    ldh a, [hWantX]
    call XYToSFieldPtr
    ld d, h
    ld e, l
    call GetPieceData
    call CanPieceFit
    cp a, $FF
    jr nz, .postmove
    ldh a, [hWantX]
    ldh [hCurrentPieceX], a
    jr .postmove

.trymoverot
    ldh a, [hCurrentPieceY]
    ld b, a
    ldh a, [hWantX]
    call XYToSFieldPtr
    ld d, h
    ld e, l
    ldh a, [hPieceDataBase]
    ld l, a
    ldh a, [hPieceDataBase+1]
    ld h, a
    ldh a, [hWantRotation]
    rlc a
    rlc a
    push bc
    ld c, a
    xor a, a
    ld b, a
    add hl, bc
    pop bc
    call CanPieceFit
    cp a, $FF
    jr nz, .postmove
    ldh a, [hWantX]
    ldh [hCurrentPieceX], a
    ldh a, [hWantRotation]
    ldh [hCurrentPieceRotationState], a
    call SetPieceDataOffset


.postmove


    ; Draw the piece.
.draw
    ldh a, [hCurrentPieceY]
    ld b, a
    ldh a, [hCurrentPieceX]
    call XYToFieldPtr
    ld d, h
    ld e, l
    call GetPieceData
    ldh a, [hCurrentPiece]
    ld b, TILE_PIECE_0
    add a, b
    ld b, a
    push hl
    push de
    pop hl
    pop de
    call DrawPiece

    ret

ENDC
