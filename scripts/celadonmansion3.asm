CeladonMansion3Script: ; 48790 (12:4790)
	jp EnableAutoTextBoxDrawing

CeladonMansion3TextPointers: ; 48793 (12:4793)
	dw ProgrammerText
	dw GraphicArtistText
	dw WriterText
	dw DirectorText
	dw GameFreakPCText1
	dw GameFreakPCText2
	dw GameFreakPCText3
	dw GameFreakSignText

ProgrammerText: ; 487a3 (12:47a3)
	TX_FAR _ProgrammerText
	db "@"

GraphicArtistText: ; 487a8 (12:47a8)
	TX_FAR _GraphicArtistText
	db "@"

WriterText: ; 487ad (12:47ad)
	TX_FAR _WriterText
	db "@"

DirectorText: ; 487b2 (12:47b2)
	db $08 ; asm

	; check rematches
	ld a, [wRematchFlag]
	and $FF
	jr nz, .CompletedDex
	ld hl, .GameDesigner
	jr .done
.CompletedDex
	ld hl, .CompletedDexText
.done
	call PrintText
	jp TextScriptEnd

.GameDesigner ; 487d0 (12:47d0)
	TX_FAR _GameDesignerKeiza
	db "@"

.CompletedDexText
	TX_FAR _CompletedRematchesText
	db $6
	db $8 ; asm
	callab DisplayDiploma
	ld hl, wRoamingFlag
	set DIPLOMASEEN, [hl]
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd

GameFreakPCText1: ; 487eb (12:47eb)
	TX_FAR _CeladonMansion3Text5
	db "@"

GameFreakPCText2: ; 487f0 (12:47f0)
	TX_FAR _CeladonMansion3Text6
	db "@"

GameFreakPCText3: ; 487f5 (12:47f5)
	TX_FAR _CeladonMansion3Text7
	db "@"

GameFreakSignText: ; 487fa (12:47fa)
	TX_FAR _CeladonMansion3Text8
	db "@"
