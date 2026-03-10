# DACHS-RALLY
Ein Rennsystem mit Checkpoints und Zeitmessung.

## Schnellinstallation
Erstelle einen Ordner mit *.Stratis* Endung und füge Inhalt von *main* und *vorzeigemission* ein.

## Funktionen
- Rennsystem mit unbeschränkt vielen Checkpoints.
- Start und Ziel (Derzeit keine Rundenstrecke möglich).
- Zeitmessung wird per silentHint angezeigt.
- Benötigte Zeit für Abschluss der Rennstrecke wird auf einen Scoreboard Objekt in der Welt angezeigt.
- Differenz zur derzeitigen Bestzeit wird bei Durchfahrt jedes Checkpoints angezeigt.
- Lebensbalken zeigt derzeiten Lebensstand des Spielers an.
- Möglichkeit zum letzten durchgefahrenen Checkpoint zurückzukehren.

## Eigene Rennstrecken erstellen
- Um das Rennen zu starten, muss der Spieler den Startbereich (Trigger) durchqueren. Platziere dafür einen Trigger mit den Variablen Namen **start** und stelle als Aktivierung **Jeder Spieler** ein. Für Aktivierungs Typ nimm **Anwesend** und aktiviere **Wiederholbar** und **Nur Server**. In der Aktivierungbox setzte folgendes ein: `[thisList] execVM "scripts\rallyStart.sqf";`
