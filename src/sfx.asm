IF !DEF(SFX_ASM)
DEF SFX_ASM EQU 1


INCLUDE "globals.asm"


DEF REG_NR10_CH1_SWEEP EQU $10
DEF REG_NR11_CH1_LENDT EQU $11
DEF REG_NR12_CH1_VOLEV EQU $12
DEF REG_NR13_CH1_FRQLO EQU $13
DEF REG_NR14_CH1_FRQHI EQU $14
DEF REG_NR21_CH2_LENDT EQU $16
DEF REG_NR22_CH2_VOLEV EQU $17
DEF REG_NR23_CH2_FRQLO EQU $18
DEF REG_NR24_CH2_FRQHI EQU $19
DEF REG_NR30_CH3_DACEN EQU $1A
DEF REG_NR31_CH3_LENGT EQU $1B
DEF REG_NR32_CH3_VOLUM EQU $1C
DEF REG_NR33_CH3_FRQLO EQU $1D
DEF REG_NR34_CH3_FRQHI EQU $1E
DEF REG_NR41_CH4_LENGT EQU $20
DEF REG_NR42_CH4_VOLEV EQU $21
DEF REG_NR43_CH4_FQRND EQU $22
DEF REG_NR44_CH4_CNTRL EQU $23
DEF REG_NR50_MVOLVINPN EQU $24
DEF REG_NR51_MASTERPAN EQU $25
DEF REG_NR52_MASTERCTL EQU $26
DEF REG_WAVE_PATTERN_0 EQU $30
DEF REG_WAVE_PATTERN_1 EQU $31
DEF REG_WAVE_PATTERN_2 EQU $32
DEF REG_WAVE_PATTERN_3 EQU $33
DEF REG_WAVE_PATTERN_4 EQU $34
DEF REG_WAVE_PATTERN_5 EQU $35
DEF REG_WAVE_PATTERN_6 EQU $36
DEF REG_WAVE_PATTERN_7 EQU $37
DEF REG_WAVE_PATTERN_8 EQU $38
DEF REG_WAVE_PATTERN_9 EQU $39
DEF REG_WAVE_PATTERN_A EQU $3A
DEF REG_WAVE_PATTERN_B EQU $3B
DEF REG_WAVE_PATTERN_C EQU $3C
DEF REG_WAVE_PATTERN_D EQU $3D
DEF REG_WAVE_PATTERN_E EQU $3E
DEF REG_WAVE_PATTERN_F EQU $3F


SECTION "Sound Effect Data", ROM0
sSFXPieceI::
    db REG_NR12_CH1_VOLEV, $F0, REG_NR22_CH2_VOLEV, $F0, REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF
    db REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $AC, REG_NR14_CH1_FRQHI, $85, REG_NR21_CH2_LENDT, $7F
    db REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80, REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87
    db $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $ED
    db REG_NR14_CH1_FRQHI, $85, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $2D, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $27
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $44, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $AC
    db REG_NR14_CH1_FRQHI, $85, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $ED
    db REG_NR14_CH1_FRQHI, $85, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $2D, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $27
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $44, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $5B
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $59, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $AC
    db REG_NR14_CH1_FRQHI, $85, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $27
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $44, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $72
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $62, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $D6
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $8A, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $14
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $A2, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $B1, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $4F
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $BA, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $62
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $80
    db REG_NR23_CH2_FRQLO, $C1, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR22_CH2_VOLEV, $F0, REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $D0
    db REG_NR13_CH1_FRQLO, $6B, REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF
    db REG_NR22_CH2_VOLEV, $D0, REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $D0, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $D0
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $D0, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $D0
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $00, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $00
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $6B, REG_NR14_CH1_FRQHI, $87, REG_NR22_CH2_VOLEV, $08
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FE
sSFXPieceIEnd::
sSFXPieceZ::
    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $7B
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $4F
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $2D
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $F7
    db REG_NR14_CH1_FRQHI, $86, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $D6
    db REG_NR24_CH2_FRQHI, $86, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $7B
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $4F
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $2D
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $F7
    db REG_NR14_CH1_FRQHI, $86, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $D6
    db REG_NR24_CH2_FRQHI, $86, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $7B
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10, REG_NR23_CH2_FRQLO, $4F
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10, REG_NR23_CH2_FRQLO, $2D
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $F7
    db REG_NR14_CH1_FRQHI, $86, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10, REG_NR23_CH2_FRQLO, $D6
    db REG_NR24_CH2_FRQHI, $86, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $F7, REG_NR14_CH1_FRQHI, $86, $FF, $FF

    db REG_NR22_CH2_VOLEV, $08, REG_NR23_CH2_FRQLO, $D6, REG_NR24_CH2_FRQHI, $86, $FE
sSFXPieceZEnd::
sSFXPieceS::
    db REG_NR12_CH1_VOLEV, $F0, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0
    db REG_NR13_CH1_FRQLO, $6B, REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $59
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $21
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR22_CH2_VOLEV, $F0, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0
    db REG_NR13_CH1_FRQLO, $39, REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F
    db REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $6B, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $7B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $7B, REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F
    db REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $59, REG_NR24_CH2_FRQHI, $87
    db $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $21
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $6B
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $7B, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $59
    db REG_NR14_CH1_FRQHI, $87, REG_NR22_CH2_VOLEV, $08, REG_NR23_CH2_FRQLO, $7B, REG_NR24_CH2_FRQHI, $87
    db $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $21
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $7B
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $7B, REG_NR14_CH1_FRQHI, $87, $FE
sSFXPieceSEnd::
sSFXPieceJ::
    db REG_NR12_CH1_VOLEV, $F1, REG_NR22_CH2_VOLEV, $F1, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F
    db REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $E7, REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F
    db REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1, REG_NR23_CH2_FRQLO, $59, REG_NR24_CH2_FRQHI, $87
    db $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $72
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1
    db REG_NR23_CH2_FRQLO, $D6, REG_NR24_CH2_FRQHI, $86, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $B2
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1
    db REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $B2, REG_NR14_CH1_FRQHI, $86, REG_NR22_CH2_VOLEV, $08
    db REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, $FE
sSFXPieceJEnd::
sSFXPieceL::
    db REG_NR12_CH1_VOLEV, $F0, REG_NR22_CH2_VOLEV, $F0, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F
    db REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $9E, REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F
    db REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $06, REG_NR24_CH2_FRQHI, $87
    db $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $C4
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F0
    db REG_NR23_CH2_FRQLO, $21, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $E7
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F0
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $9E
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $06, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $C4
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $21, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $E7
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $9E
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $06, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $C4
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $21, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $E7
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $E7, REG_NR14_CH1_FRQHI, $86, REG_NR22_CH2_VOLEV, $08
    db REG_NR23_CH2_FRQLO, $39, REG_NR24_CH2_FRQHI, $87, $FE
sSFXPieceLEnd::
sSFXPieceO::
    db REG_NR22_CH2_VOLEV, $F0, REG_NR32_CH3_VOLUM, $20, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF
    db REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, REG_NR30_CH3_DACEN, $00
    db REG_WAVE_PATTERN_0, $FF, REG_WAVE_PATTERN_1, $ED, REG_WAVE_PATTERN_2, $CB, REG_WAVE_PATTERN_3, $A9
    db REG_WAVE_PATTERN_4, $87, REG_WAVE_PATTERN_5, $65, REG_WAVE_PATTERN_6, $43, REG_WAVE_PATTERN_7, $21
    db REG_WAVE_PATTERN_8, $12, REG_WAVE_PATTERN_9, $34, REG_WAVE_PATTERN_A, $56, REG_WAVE_PATTERN_B, $78
    db REG_WAVE_PATTERN_C, $9A, REG_WAVE_PATTERN_D, $BC, REG_WAVE_PATTERN_E, $DE, REG_WAVE_PATTERN_F, $FF
    db REG_NR30_CH3_DACEN, $00, REG_NR30_CH3_DACEN, $80, REG_NR32_CH3_VOLUM, $20, REG_NR33_CH3_FRQLO, $B2
    db REG_NR34_CH3_FRQHI, $86, $FF, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $F7
    db REG_NR24_CH2_FRQHI, $86, REG_NR30_CH3_DACEN, $00, REG_NR30_CH3_DACEN, $80, REG_NR32_CH3_VOLUM, $20
    db REG_NR33_CH3_FRQLO, $89, REG_NR34_CH3_FRQHI, $86, $FF, $FF, $FF, $FF, $FF

    db REG_NR22_CH2_VOLEV, $08, REG_NR23_CH2_FRQLO, $F7, REG_NR24_CH2_FRQHI, $86, REG_NR32_CH3_VOLUM, $00
    db REG_NR33_CH3_FRQLO, $89, REG_NR34_CH3_FRQHI, $06, $FF, $FF, $FF

    db REG_NR32_CH3_VOLUM, $60, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $40
    db REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, REG_NR30_CH3_DACEN, $00, REG_NR30_CH3_DACEN, $80
    db REG_NR32_CH3_VOLUM, $60, REG_NR33_CH3_FRQLO, $B2, REG_NR34_CH3_FRQHI, $86, $FF, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $40, REG_NR23_CH2_FRQLO, $F7
    db REG_NR24_CH2_FRQHI, $86, REG_NR30_CH3_DACEN, $00, REG_NR30_CH3_DACEN, $80, REG_NR32_CH3_VOLUM, $60
    db REG_NR33_CH3_FRQLO, $89, REG_NR34_CH3_FRQHI, $86, $FF, $FF, $FF, $FF, $FF

    db REG_NR22_CH2_VOLEV, $08, REG_NR23_CH2_FRQLO, $F7, REG_NR24_CH2_FRQHI, $86, REG_NR32_CH3_VOLUM, $00
    db REG_NR33_CH3_FRQLO, $89, REG_NR34_CH3_FRQHI, $06, $FF, $FF, $FF

    db REG_NR32_CH3_VOLUM, $00, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $14, REG_NR24_CH2_FRQHI, $87, REG_NR30_CH3_DACEN, $00, REG_NR30_CH3_DACEN, $80
    db REG_NR32_CH3_VOLUM, $00, REG_NR33_CH3_FRQLO, $B2, REG_NR34_CH3_FRQHI, $86, $FF, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $F7
    db REG_NR24_CH2_FRQHI, $86, REG_NR30_CH3_DACEN, $00, REG_NR30_CH3_DACEN, $80, REG_NR32_CH3_VOLUM, $00
    db REG_NR33_CH3_FRQLO, $89, REG_NR34_CH3_FRQHI, $86, $FF, $FF, $FF, $FF, $FF

    db REG_NR22_CH2_VOLEV, $08, REG_NR23_CH2_FRQLO, $F7, REG_NR24_CH2_FRQHI, $86, REG_NR32_CH3_VOLUM, $00
    db REG_NR33_CH3_FRQLO, $89, REG_NR34_CH3_FRQHI, $06, $FE
sSFXPieceOEnd::
sSFXPieceT::
    db REG_NR12_CH1_VOLEV, $F0, REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0
    db REG_NR13_CH1_FRQLO, $8A, REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF
    db REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $62, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $2D
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $06
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $D6
    db REG_NR14_CH1_FRQHI, $86, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $F7
    db REG_NR24_CH2_FRQHI, $86, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $14
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $2D
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $62
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $F0, REG_NR23_CH2_FRQLO, $8A
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $D6
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20
    db REG_NR23_CH2_FRQLO, $06, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $F7
    db REG_NR24_CH2_FRQHI, $86, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $14
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $2D
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $20, REG_NR13_CH1_FRQLO, $62
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $20, REG_NR23_CH2_FRQLO, $8A
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $D6
    db REG_NR14_CH1_FRQHI, $86, REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10
    db REG_NR23_CH2_FRQLO, $06, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10, REG_NR23_CH2_FRQLO, $F7
    db REG_NR24_CH2_FRQHI, $86, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $14
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10, REG_NR23_CH2_FRQLO, $2D
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $BF, REG_NR11_CH1_LENDT, $BF, REG_NR12_CH1_VOLEV, $10, REG_NR13_CH1_FRQLO, $62
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF

    db REG_NR21_CH2_LENDT, $BF, REG_NR21_CH2_LENDT, $BF, REG_NR22_CH2_VOLEV, $10, REG_NR23_CH2_FRQLO, $8A
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $62, REG_NR14_CH1_FRQHI, $87, REG_NR22_CH2_VOLEV, $08
    db REG_NR23_CH2_FRQLO, $8A, REG_NR24_CH2_FRQHI, $87, $FE
sSFXPieceTEnd::
sSFXIRS::
    db REG_NR42_CH4_VOLEV, $F2, REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $F2, REG_NR43_CH4_FQRND, $44
    db REG_NR44_CH4_CNTRL, $80, $FF

    db REG_NR43_CH4_FQRND, $15, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $01, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR12_CH1_VOLEV, $F1, REG_NR22_CH2_VOLEV, $F1, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F
    db REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $6B, REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F
    db REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81, REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87
    db REG_NR42_CH4_VOLEV, $08, REG_NR43_CH4_FQRND, $44, REG_NR44_CH4_CNTRL, $80, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $9D
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81
    db REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $B6
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81
    db REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $C5
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81
    db REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $CE
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81
    db REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $D6
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81
    db REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $D9
    db REG_NR14_CH1_FRQHI, $87, REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $81
    db REG_NR23_CH2_FRQLO, $DF, REG_NR24_CH2_FRQHI, $87, $FE
sSFXIRSEnd::
sSFXDrop::
    db REG_NR12_CH1_VOLEV, $F0, REG_NR42_CH4_VOLEV, $F1, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F
    db REG_NR12_CH1_VOLEV, $F0, REG_NR13_CH1_FRQLO, $9D, REG_NR14_CH1_FRQHI, $84, REG_NR41_CH4_LENGT, $3F
    db REG_NR42_CH4_VOLEV, $F1, REG_NR43_CH4_FQRND, $57, REG_NR44_CH4_CNTRL, $80, $FF

    db REG_NR13_CH1_FRQLO, $12, REG_NR14_CH1_FRQHI, $03, $FF

    db REG_NR13_CH1_FRQLO, $D2, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $80, REG_NR13_CH1_FRQLO, $39
    db REG_NR14_CH1_FRQHI, $81, REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $F1, REG_NR43_CH4_FQRND, $47
    db REG_NR44_CH4_CNTRL, $80, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $80, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FF

    db REG_NR13_CH1_FRQLO, $01, REG_NR14_CH1_FRQHI, $00, $FE
sSFXDropEnd::
sSFXLock::
    db REG_NR42_CH4_VOLEV, $F2, REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $12, REG_NR43_CH4_FQRND, $14
    db REG_NR44_CH4_CNTRL, $80, $FF

    db REG_NR43_CH4_FQRND, $00, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $00, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $F2, REG_NR43_CH4_FQRND, $A4, REG_NR44_CH4_CNTRL, $80
    db $FF

    db REG_NR43_CH4_FQRND, $75, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $55, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $35, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $14, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $00, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $22, REG_NR43_CH4_FQRND, $A4, REG_NR44_CH4_CNTRL, $80
    db $FF

    db REG_NR43_CH4_FQRND, $75, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $55, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $12, REG_NR43_CH4_FQRND, $A4, REG_NR44_CH4_CNTRL, $80
    db $FF

    db REG_NR43_CH4_FQRND, $75, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $55, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $35, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $14, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $00, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $00, REG_NR44_CH4_CNTRL, $00, $FF

    db REG_NR43_CH4_FQRND, $00, REG_NR44_CH4_CNTRL, $00, $FE
sSFXLockEnd::
sSFXBell::
    db REG_NR12_CH1_VOLEV, $F1, REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1
    db REG_NR13_CH1_FRQLO, $A7, REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1, REG_NR23_CH2_FRQLO, $97
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $A7
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1, REG_NR23_CH2_FRQLO, $97
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $A7
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1, REG_NR23_CH2_FRQLO, $97
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR11_CH1_LENDT, $7F, REG_NR11_CH1_LENDT, $7F, REG_NR12_CH1_VOLEV, $F1, REG_NR13_CH1_FRQLO, $A7
    db REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR21_CH2_LENDT, $7F, REG_NR21_CH2_LENDT, $7F, REG_NR22_CH2_VOLEV, $F1, REG_NR23_CH2_FRQLO, $97
    db REG_NR24_CH2_FRQHI, $87, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db $FF

    db REG_NR12_CH1_VOLEV, $08, REG_NR13_CH1_FRQLO, $A7, REG_NR14_CH1_FRQHI, $87, $FF, $FF, $FF, $FF

    db REG_NR22_CH2_VOLEV, $08, REG_NR23_CH2_FRQLO, $97, REG_NR24_CH2_FRQHI, $87, $FE
sSFXBellEnd::
sSFXMove::
    db REG_NR42_CH4_VOLEV, $21, REG_NR41_CH4_LENGT, $3F, REG_NR42_CH4_VOLEV, $21, REG_NR43_CH4_FQRND, $00
    db REG_NR44_CH4_CNTRL, $80, $FE
sSFXMoveEnd::


SECTION "SFX Variables", HRAM
hPlayhead:: ds 2
hPlayQueue:: ds 4


SECTION "SFX Functions", ROM0
SFXInit::
    ; Audio on, volume on, and enable all channels.
    ld a, $80
    ldh [rNR52], a
    ld a, $FF
    ldh [rNR51], a
    ld a, $77
    ldh [rNR50], a

    ld a, $FF
    ldh [hPlayQueue], a
    ldh [hPlayQueue+1], a
    ldh [hPlayQueue+2], a
    ldh [hPlayQueue+3], a
    xor a, a
    ldh [hPlayhead], a
    ldh [hPlayhead+1], a
    ret


SFXPopQueue:
    ; Pop the head of the queue into A, the tail of the queue will be set to $FF.
    ldh a, [hPlayQueue]
    ld b, a
    ldh a, [hPlayQueue+1]
    ldh [hPlayQueue], a
    ldh a, [hPlayQueue+2]
    ldh [hPlayQueue+1], a
    ldh a, [hPlayQueue+3]
    ldh [hPlayQueue+2], a
    ld a, $FF
    ldh [hPlayQueue+3], a
    ld a, b
    ret


SFXPushQueue:
    ; Push A onto the tail of the queue, the head of the queue will be pushed off.
    ld b, a
    ldh a, [hPlayQueue+1]
    ldh [hPlayQueue], a
    ldh a, [hPlayQueue+2]
    ldh [hPlayQueue+1], a
    ldh a, [hPlayQueue+3]
    ldh [hPlayQueue+2], a
    ld a, b
    ldh [hPlayQueue+3], a
    ret


SFXProcessQueue:
    ; Clear the playhead.
    xor a, a
    ldh [hPlayhead], a
    ldh [hPlayhead+1], a

    ; Try 4 times to pop a sound effect off the queue.
    call SFXPopQueue
    cp a, $FF
    jr nz, :+
    call SFXPopQueue
    cp a, $FF
    jr nz, :+
    call SFXPopQueue
    cp a, $FF
    jr nz, :+
    call SFXPopQueue
    cp a, $FF
    ret z

    ; If we got a valid sound effect, then play it.
    call SFXEnqueue
    ret


    ; Attempt to play the sound effect in A. Will enqueue the sound effect if the play routine is currently busy.
SFXEnqueue::
    ; If the playhead isn't null, then we're already playing something.
    ld b, a
    ldh a, [hPlayhead]
    ld l, a
    ldh a, [hPlayhead+1]
    ld h, a
    or a, l
    jr z, :+
    ld a, b
    call SFXPushQueue
    ret

    ; Play the sound effect for the sfx id in A.
:   ld a, b
    cp a, PIECE_I
    jr nz, :+
    ld a, LOW(sSFXPieceI)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceI)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, PIECE_S
    jr nz, :+
    ld a, LOW(sSFXPieceS)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceS)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, PIECE_Z
    jr nz, :+
    ld a, LOW(sSFXPieceZ)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceZ)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, PIECE_J
    jr nz, :+
    ld a, LOW(sSFXPieceJ)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceJ)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, PIECE_L
    jr nz, :+
    ld a, LOW(sSFXPieceL)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceL)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, PIECE_O
    jr nz, :+
    ld a, LOW(sSFXPieceO)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceO)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, PIECE_T
    jr nz, :+
    ld a, LOW(sSFXPieceT)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXPieceT)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, SFX_IRS
    jr nz, :+
    ld a, LOW(sSFXIRS)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXIRS)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, SFX_DROP
    jr nz, :+
    ld a, LOW(sSFXDrop)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXDrop)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, SFX_LOCK
    jr nz, :+
    ld a, LOW(sSFXLock)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXLock)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, SFX_BELL
    jr nz, :+
    ld a, LOW(sSFXBell)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXBell)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret

:   cp a, SFX_MOVE
    ret nz
    ld a, LOW(sSFXMove)
    ldh [hPlayhead], a
    ld a, HIGH(sSFXMove)
    ldh [hPlayhead+1], a
    call SFXPlay
    ret


    ; This play routine must be called every frame.
SFXPlay::
    ; Load the playhead position into HL.
    ldh a, [hPlayhead]
    ld l, a
    ldh a, [hPlayhead+1]
    ld h, a

    ; Nothing to do if it's a null ptr.
    or a, l
    ret z

    ; Otherwise, get the register to write to.
.getRegister
    ld a, [hl]
    inc hl

    ; If it's $FE, then we're done. Check if there's more for us in the queue.
    cp a, $FE
    jr nz, :+
    call SFXProcessQueue
    ret

    ; If it's $FF, then we're done for this frame.
:   cp a, $FF
    jr z, .savePlayhead

    ; Otherwise, put the register in C.
    ld c, a

    ; Get the value to write.
    ld a, [hl]
    inc hl

    ; Write it and loop.
    ldh [$ff00+c], a
    jr .getRegister

    ; Save the playhead position.
.savePlayhead
    ld a, l
    ldh [hPlayhead], a
    ld a, h
    ldh [hPlayhead+1], a
    ret


ENDC
