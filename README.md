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
- Um das Rennen zu starten, muss der Spieler den Startbereich (Trigger) durchqueren. Platziere dafür einen Trigger mit den Variablen Namen **start** und stelle als Aktivierung **Jeder Spieler** ein. Für Aktivierungs Typ nimm **Anwesend** und aktiviere **Wiederholbar** und **Nur Server**. Der Interval zur Überprüfung der Condition sollte auf 0.05 eingestellt werden. In der Aktivierungbox setzte folgendes ein: `[thisList] execVM "scripts\rallyStart.sqf";`
- Für die weiteren Checkpoints platziere jeweils einen weiteren Trigger mit der Namensgebung **checkpoint_x** wobei x hier die aufzählende Nummerierung ist. Diese Nummerierung wird standardmäßig beim Speichern und Einfügen hochgezählt. Es empfiehlt sich also einmal den Checkpoint komplett einzustellen und dann einfach an den passenden Stellen einzufügen. Wie auch schon beim Startbereich werden die gleichen Aktivierungen benötigt. Also **Jeder Spieler**, **Anwesend**, **Wiederholbar** und **Nur Server**. Interval sollte auf 0.1 oder niedriger eingestellt werden, damit auch Fahrzeuge mit hoher Geschwindigkeit erkannt werden. In der Aktivierungsbox füge folgenden Code ein: `[thisList,thisTrigger] execVM "scripts\rallyCheckpoint.sqf";`.
- Das Ende der Rennstrecke wird mit dem **end** Trigger gekennzeichnet. Gleiche Einstellungen wie bei den anderen Triggern und in der Aktivierungsbox wird folgender Code eingefügt: `[thisList,22] execVM "scripts\rallyEnd.sqf";`. Wobei hier die Zahl **22** die Anzahl der Checkpoints darstellt. 
