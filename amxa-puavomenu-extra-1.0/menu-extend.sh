#!/bin/sh

if ! test -f /etc/puavomenu/menudata.yaml.ori; then
    cp /etc/puavomenu/menudata.yaml /etc/puavomenu/menudata.yaml.ori
    cat /etc/puavomenu/menudata.yaml|sed -n -e '/^programs:$/,/^menus:$/p'|sed -e '1d;$d' >/etc/puavomenu/menu-programs.yaml
fi


MENU=$(cat /etc/puavomenu/menu-programs.yaml |grep "^  - .*" |sed 's/-//g'|sed 's/://g'|xargs)
APPS=$(cd /usr/share/applications; ls *desktop|sed 's/.desktop//g'|xargs)



echo "---" > /etc/puavomenu/menudata.yaml
echo >> /etc/puavomenu/menudata.yaml
echo "programs:" >> /etc/puavomenu/menudata.yaml

echo "  - obs:" >> /etc/puavomenu/menudata.yaml
echo "          icon: /usr/share/icons/hicolor/256x256/apps/obs.png" >> /etc/puavomenu/menudata.yaml
echo >> /etc/puavomenu/menudata.yaml

echo "  - gummi:" >> /etc/puavomenu/menudata.yaml
echo "          description: Einfache Latex Umgebung" >> /etc/puavomenu/menudata.yaml
echo >> /etc/puavomenu/menudata.yaml


MENU="$MENU obs gummi"

for A in $APPS; do
    FOUND=false
    for M in $MENU; do
	if test "$A" = "$M"; then
	    FOUND=true
	fi
    done
    if ! $FOUND; then
	echo "  - $A" >> /etc/puavomenu/menudata.yaml
    fi
done
cat /etc/puavomenu/menu-programs.yaml >> /etc/puavomenu/menudata.yaml

#rm /tmp/menudata-programs.sy

echo '
menus:

  - menu-applications:
        icon: /usr/share/icons/Faenza/categories/48/applications-accessories.png
        name:
            en: Applications
            fi: Apuohjelmat
            sv: Verktyg
            de: Werkzeuge
        programs:
            - gnome-calculator
            - org.gnome.gedit
            - gucharmap
            - onboard
            - brasero
            - sound-juicer
            - org.gnome.FileRoller
            - org.gnome.Terminal
            - gftp
            - seahorse
            - system-config-printer
            - pavucontrol
            - org.gnome.Screenshot
            - simplescreenrecorder
            - airtame
#
            - xosview

  - menu-graphics:
        name:
            en: Graphics
            fi: Grafiikka
            sv: Grafik
            de: Grafik
        description:
            en: Graphics applications
            fi: Piirto- ja kuvankäsittelyohjelmia
            sv: Ritprogram
            de: Grafikprogramme
        icon: /usr/share/icons/Faenza/categories/48/applications-painting.png
        programs:
            - org.kde.kolourpaint
            - org.kde.krita
            - tuxpaint
            - mypaint
            - gimp
            - pinta
            - gthumb
            - eog
            - shotwell
            - inkscape
            - simple-scan
            - xsane
            - blender
            - cura
            - sketchup
            - freecad
            - openscad-nightly
            - FlashPrint
#
            - photocollage


  - menu-internet:
        icon: /usr/share/icons/Faenza/categories/48/applications-internet.png
        name: Internet
        description:
            en: Internet-applications
            fi: Internet-sovellukset
            sv: Internet-program
            de: "Internet Programme"
        programs:
            - firefox
            - chromium
            - google-chrome
            - thunderbird
            - evolution
            - pidgin
            - gftp
            - net.sourceforge.liferea
            - google-earth
            - skype
            - empathy
            - vinagre
            - dropbox
            - VidyoDesktop

  - menu-programming:
        name:
            en: Programming
            fi: Ohjelmointi
            sv: Programmering
            de: Programmierung
        description:
            en: "Programming environments"
            fi: Ohjelmointiympäristöjä
        icon: /usr/share/icons/Faenza/categories/48/gnome-devel.png
        programs:
            - asebastudio
            - thymiovpl
            - primalogo
            - arduino
            - fritzing
            - teddybear
            - drracket
            - enchanting
            - bluegriffon
            - eclipse
            - eric
            - pycharm
            - spe
            - idle-python2.7
            - idle-python3.5
            - geany
            - org.kde.kturtle
            - scratch
            - bluefish
            - designer-qt4
            - processing
            - robboscratch2
            - appinventor
            - kojo
            - Nightcode
#
            - dosbox
            - thymiownetconfig
            - thymioupgrader

  - menu-education:
        name:
            en: Education
            fi: Opetusohjelmat
            sv: Undervisningsprogram
            de: Bildung
        description:
            en: "Educational applications"
            fi: "Sovelluksia oppimisen tueksi"
            sv: "Pedagogiska program"
            de: "Bildungs Programme"
        icon: /usr/share/icons/Faenza/categories/48/applications-games.png
        programs:
            - ekapeli
            - spelett
            - ekapeli-maahanmuuttaja
            - ekapeli-alku
            - db_koulu1
            - gcompris
            - tuxmath
            - org.kde.kbruch
            - geogebra
            - geogebra6
            - org.kde.kmplot
            - mafynetti
            - marble-qt
            - google-earth
            - org.kde.kgeography
            - org.kde.kwordquiz
            - org.kde.khangman
            - org.kde.ktouch
            - celestia
            - stellarium
            - org.kde.kstars
            - org.kde.step
            - LoggerPro
            - GlobiLab
            - wxMaxima
            - ti_nspire_cx_cas_ss
            - avogadro
            - org.kde.kalzium
            - MarvinSketch
            - MarvinView
            - mandelbulber
            - qgis
            - anki

  - menu-office:
        name:
            en: Office
            fi: Toimisto
            sv: Kontor
            de: Büro
        description:
            en: "Office applications"
            fi: Toimisto-ohjelmat
            sv: Kontorsprogram
            de: Büroprogramme
        icon: /usr/share/icons/Faenza/categories/48/applications-office.png
        programs:
            - libreoffice-writer
            - libreoffice-calc
            - libreoffice-impress
            - libreoffice-draw
            - libreoffice-base
            - libreoffice-math
            - scribus
            - vym
            - cmaptools
            - acroread
            - okular
            - evince
            - calibre-gui
            - tellico
            - openboard
            - primusclient
            - dia
#            - tilitin
#            - t-lasku
#
            - gummi
            - texmaker
            - pdfshuffler
            - xmind

  - menu-audio:
        name:
            en: "Audio and video"
            fi: "Ääni ja video"
            sv: "Ljud och Video"
            de: "Audio und Video"
        icon: /usr/share/icons/Faenza/categories/48/applications-multimedia.png
        programs:
            - ghb
            - audacity
            - goobox
            - vlc
            - org.kde.kaffeine
            - spotify
            - org.gnome.Cheese
            - kenavision
            - kamerka
            - openshot
            - org.kde.kdenlive
            - kino
            - pitivi
            - solfege
            - mscore
            - hydrogen
            - lmms
            - rosegarden
            - tuxguitar
            - fmit
            - qstopmotion
            - qsynth
            - qjackctl
            - winff
            - sonic-pi

  - menu-games:
        name:
            en: Games
            fi: Pelit
            sv: Spel
            de: Spiele
        icon: /usr/share/icons/Faenza/categories/48/applications-cardgames.png
        condition: "!personally_administered"
        programs:
            - gnome-klotski
            - gnome-mines
            - gnome-mahjongg
            - sol
            - gnome-sudoku
            - luola
            - openttd
            - gnubg
            - freeciv-gtk2

  - menu-games-personal:
        name:
            en: Games
            fi: Pelit
            sv: Spel
            de: Spiele
        icon: /usr/share/icons/Faenza/categories/48/applications-cardgames.png
        condition: "personally_administered"
        programs:
            - gnome-klotski
            - gnome-mines
            - gnome-mahjongg
            - sol
            - gnome-sudoku
            - supertuxkart
            - neverball
            - neverputt
            - luola
            - openttd
            - xmoto
            - steam
            - gnubg
            - freeciv-gtk2

  - menu-abitti:
        name:
            en: Abitti-applications
            fi: Abitti-sovellukset
            sv: Abitti-applikationer
            de: Prüfungsumgebung
        description:
            fi: Sovelluksia sähköiseen ylioppilastutkintoon
            en: Programs for Grading Environment
            de: Programme der Prüfungsumgebung
        icon: /usr/share/icons/oxygen/base/48x48/categories/applications-education.png
        programs:
            - gimp
            - pinta
            - inkscape
            - geogebra
            - geogebra6
            - wxMaxima
            - ti_nspire_cx_cas_ss
            - LoggerPro
            - dia
            - libreoffice-writer
            - libreoffice-calc
            - libreoffice-impress
            - libreoffice-draw
            - libreoffice-base
            - libreoffice-math

  - menu-whiteboards:
        name:
            en: "Interactive\nwhiteboards"
            fi: Älytaulut
            sv: "Interaktiva tavlor"
            de: Whiteboard
        icon: /usr/share/icons/Faenza/categories/96/applications-science.png
#        condition: "!personally_administered"
        programs:
            - smarttech-notebook
            - openboard
            - mimio-notebook
#
            - activsoftware
            - active-software-nc
            - vmarkerutility
            - classroomscreen
            - pahvi
            - onboard
            - liberoffice-impress
            - impressive
            - obs
            - simplescreenrecorder
            - gtk-recordmydesktop

  - menu-web:
        name:
            en: Web applications
            fi: Web-sovellukset
            sv: Web applikationer
            de: Web Anwendungen
        icon: /usr/share/icons/Gion/48x48/categories/xfce-internet.png
        programs:
            - youtube
            - wikipedia
            - yleareena
            - ylearkisto
            - sumopaint
            - walma
            - pahvi
            - sanomapro
            - otava
            - ekapeliweb
            - edison
            - unelmakoulu
            - pedanet
            - viope

# ################################################edu###############################

  - menu-deutsch:
        name:
            en: "German Language"
            de: Deutsch
        icon: /usr/share/icons/Faenza/apps/64/gnome-dictionary.png
        programs:
            - antolin
#            - ??????
            - duden
            - fragfinn
            - kindersuchmaschine
            - leseachlau
            - lesewerkstatt
            - lerntrix
            - helles-koepfchen
            - pahvi
            - openthesaurus
            - minibooks
            - mymoment
            - dybuster-ortho
            - flickr
#
            - libreoffice-writer
            - gcompris
            - org.kde.khangman
            - org.kde.kwordquiz
            - org.kde.ktouch
#            - kahoot
            - youtube

  - menu-mathematik:
        name:
            en: Mathematics
            fi: Matematiikka
            de: Mathematik
        icon: /usr/share/icons/Faenza/categories/64/applications-interfacedesign.png
        programs:
            - tuxmath
            - blitzrechnen
            - rechentraining
            - rechentraining6
            - logisch1
            - logisch2
            - logisch3
            - logisch4
            - logisch5
            - logisch6
            - mathe-aktiv-division
            - mathe-aktiv-insaetze
            - mathe-aktiv-multiplikation
            - mathe1trainer
            - mathe2trainer
            - mathe3trainer
            - mathe4trainer
            - mathe5trainer
            - mathe6trainer
            - sikore
            - mathe-im-netz
            - dybuster-calc
            - mathwelt
#
            - org.kde.kbruch
            - geogebra
            - geogebra6
            - org.kde.kmplot
            - gnome-calculator
#            - teddybear
#            - scratch
#            - scratch-club
#            - python-club
#            - arduino
            - libreoffice-calc
            - libreoffice-math
            - wxMaxima
            - youtube

  - menu-franzoesisch:
        name:
            en: "French Language"
            de: Französisch
        icon: /usr/share/icons/oxygen/base/64x64/categories/applications-education-language.png
        programs:
            - millefeuilles3.1
            - millefeuilles3.2
            - millefeuilles3.3
            - millefeuilles4.1
            - millefeuilles4.2
            - millefeuilles4.3
            - millefeuilles5.1
            - millefeuilles5.2
            - millefeuilles6.1
            - millefeuilles6.2
            - millefeuilles
            - mfonline
            - fichier
            - duolingo
            - leo
            - google-translate
#
            - libreoffice-writer
            - org.kde.kwordquiz
            - org.kde.khangman
            - youtube

  - menu-englisch:
        name:
            en: "English language"
            de: Englisch
        icon: /usr/share/icons/Faenza/apps/64/config-language.png
        programs:
            - newworld1
            - newworld2
            - duolingo
            - leo
#
            - libreoffice-writer
            - org.kde.kwordquiz
            - org.kde.khangman
            - youtube

  - menu-naturundtechnik:
        name:
            en: "Environmental Science"
            de: "Natur und Technik"
        icon: /usr/share/icons/Faenza/apps/64/tracker.png
        programs:
            - bodenlift
            - kinderwald
            - fragfinn
            - kindersuchmaschine
            - cool-driving
            - unserkoerper
            - minetest
#
            - marble-qt
            - google-earth
            - org.kde.kgeography
            - celestia
            - stellarium
            - org.kde.kstars
            - libreoffice-writer
#            - kahoot
            - youtube

  - menu-medienundprogrammierung:
        name:
            en: "Media and Programming"
            de: "Medien und Programmierung"
        description:
            en: "Programming an Media"
            de: "Medien und Programmierung"
        icon: /usr/share/icons/Faenza/categories/48/gnome-devel.png
        programs:
            - netla
            - netcity
            - code.org
#            - aseba*
            - primalogo
            - blockly
#
            - thymiovpl
            - asebastudio
            - asebaplayground
            - arduino
            - fritzing
            - teddybear
#            - drracket
            - enchanting
            - bluegriffon
#            - eclipse
            - eric
            - pycharm
            - spe
            - idle-python2.7
            - idle-python3.5
            - geany
            - org.kde.kturtle
            - scratch
            - bluefish
            - designer-qt4
            - processing
            - robboscratch2
            - appinventor
            - kojo
            - Nightcode
#
#            - dosbox

  - menu-musik:
        name:
            en: Music
            fi: Musiikki
            de: Musik
        icon: /usr/share/icons/Faenza/apps/64/gmusicbrowser.png
        programs:
            - musikwissenschaften
            - notenmax
            - flubidux
            - audiyou
#
            - audacity
            - solfege
            - hydrogen
            - lmms
            - mscore
            - spotify
            - libreoffice-writer
#            - kahoot
            - youtube

  - menu-raeumezeitengesellschaften:
        name:
            en: "Spaces, Times and Society"
            de: "Raeume, Zeiten und Gesellschaften"
        icon: /usr/share/tuxpaint/stamps/space/planets/3_earth.png
        programs:
            - map-geo-admin
            - schulkarte
            - toporopa
            - zeitklicks
#            - uno spiel
            - openstreetmap
#
            - marble-qt
            - google-earth
            - org.kde.kgeography
            - celestia
            - stellarium
            - org.kde.kstars
            - qgis
            - libreoffice-writer
#            - kahoot
            - youtube

  - menu-gestalten:
        name:
            en: Handicrafts
            de: Gestalten
        icon: /usr/share/icons/Neu/128x128/categories/kcontrol.png
        programs:
            - tuxpaint
            - scribus
            - minitube
            - minibooks
            - audacity
            - audiyou
            - photofilmstrip
            - pitivi
            - openshot
            - flickr
#
            - pinta
            - gimp
            - inkscape
#            - sumopaint
            - fritzing
            - arduino
#            - teddybear
            - libreoffice-writer
#            - kahoot
            - youtube

# #################################################################################3

  - menu-physics:
        name:
            en: Physics
            fi: Fysiikka
            de: Physik
        icon: /usr/share/icons/hicolor/64x64/apps/step.png
        programs:
            - org.kde.step
            - LoggerPro
            - libreoffice-writer
            - phet
            - youtube

  - menu-chemistry:
        name:
            en: Chemistry
            fi: Kemia
            de: Chemie
        icon: /usr/share/icons/hicolor/48x48/apps/kalzium.png
        programs:
            - avogadro
            - MarvinSketch
            - MarvinView
            - org.kde.kalzium
            - LoggerPro
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-mathematics:
        name:
            en: Mathematics
            fi: Matematiikka
            de: Mathematik
        icon: /usr/share/icons/Faenza/categories/64/applications-interfacedesign.png
        programs:
            - tuxmath
            - org.kde.kbruch
            - geogebra
            - geogebra6
            - org.kde.kmplot
            - gnome-calculator
            - teddybear
            - scratch
            - scratch-club
            - python-club
            - arduino
            - libreoffice-calc
            - libreoffice-math
            - libreoffice-writer
            - wxMaxima
            - kahoot
            - youtube

  - menu-geography:
        name:
            en: Geography
            fi: Maantieto
            de: Geografie
        icon: /usr/share/tuxpaint/stamps/space/planets/3_earth.png
        programs:
            - marble-qt
            - google-earth
            - org.kde.kgeography
            - celestia
            - stellarium
            - org.kde.kstars
            - qgis
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-environment:
        name:
            en: Environmental Science
            fi: Ympäristöoppi
            de: Umweltwissenschaften
        icon: /usr/share/icons/Faenza/apps/64/tracker.png
        programs:
            - marble-qt
            - google-earth
            - org.kde.kgeography
            - celestia
            - stellarium
            - org.kde.kstars
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-biology:
        name:
            en: Biology
            fi: Biologia
            de: Biologie
        icon: /opt/webmenu/extra/icons/apps/applications-biology.svg
        programs:
            - perunakellari
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-socialsciences:
        name:
            en: Social Sciences
            fi: Yhteiskuntaoppi
            de: Sozialwissenschaften
        icon: /usr/share/icons/Faenza/emblems/64/emblem-sales.png
        programs:
            - ekapeli
            - ekapeli-maahanmuuttaja
            - ekapeli-alku
            - google-earth
            - ylearkisto
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-history:
        name:
            en: History
            fi: Historia
            de: Geschichte
        icon: /usr/share/icons/hicolor/128x128/apps/freeciv-client.png
        programs:
            - marble-qt
            - google-earth
            - ylearkisto
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-literature:
        name:
            en: English and literature
            fi: Äidinkieli ja kirjallisuus
            de: Englisch
        icon: /usr/share/icons/Faenza/apps/64/gnome-dictionary.png
        programs:
            - ekapeli
            - ekapeli-maahanmuuttaja
            - ekapeli-alku
            - libreoffice-writer
            - gcompris
            - org.kde.khangman
            - org.kde.kwordquiz
            - org.kde.ktouch
            - libreoffice-impress
            - ylearkisto
            - kahoot
            - youtube

  - menu-languages:
        name:
            en: Foreign languages
            fi: Vieraat kielet
            de: Muttersprache
        icon: /usr/share/icons/oxygen/base/64x64/categories/applications-education-language.png
        programs:
            - libreoffice-writer
            - org.kde.kwordquiz
            - org.kde.khangman
            - kahoot
            - youtube

  - menu-foreign:
        name:
            en: Foreign languages
            fi: Toinen kotimainen
            de: Fremdsprachen
        icon: /usr/share/icons/Faenza/apps/64/config-language.png
        programs:
            - ekapeli
            - ekapeli-maahanmuuttaja
            - ekapeli-alku
            - libreoffice-writer
            - org.kde.kwordquiz
            - org.kde.khangman
            - kahoot
            - youtube

  - menu-music:
        name:
            en: Music
            fi: Musiikki
            de: Musik
        icon: /usr/share/icons/Faenza/apps/64/gmusicbrowser.png
        programs:
            - audacity
            - solfege
            - hydrogen
            - lmms
            - mscore
            - spotify
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-crafts:
        name:
            en: Handicrafts
            fi: Käsityö
            de: Gestalten
        icon: /usr/share/icons/Neu/128x128/categories/kcontrol.png
        programs:
            - pinta
            - gimp
            - inkscape
            - sumopaint
            - fritzing
            - arduino
            - teddybear
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-arts:
        name:
            en: Arts
            fi: Kuvataide
            de: Kunst
        icon: /usr/share/icons/Faenza/apps/64/mypaint.png
        programs:
            - tuxpaint
            - org.kde.kolourpaint
            - org.kde.krita
            - mypaint
            - pinta
            - gimp
            - inkscape
            - sumopaint
            - simple-scan
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-counseling:
        name:
            en: Student counseling
            fi: Oppilaanohjaus
            de: Schülerberatung
        icon: /usr/share/icons/oxygen/base/128x128/apps/system-users.png
        programs:
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-econ:
        name:
            en: Home economics
            fi: Kotitalous
            de: Wirtschaft
        icon: /opt/webmenu/extra/icons/apps/applications-java.svg
        programs:
            - libreoffice-writer
            - amme
            - kahoot
            - youtube

  - menu-sports:
        name:
            en: Sports
            fi: Liikunta
            de: Sport
        icon: /opt/webmenu/extra/icons/apps/applications-sports.svg
        programs:
            - libreoffice-writer
            - google-earth
            - kahoot
            - youtube

  - menu-health:
        name:
            en: Health
            fi: Terveystieto
            de: Gesundheit
        icon: /usr/share/icons/gnome/48x48/emblems/emblem-favorite.png
        programs:
            - libreoffice-writer
            - google-earth
            - kahoot
            - youtube

  - menu-ethics:
        name:
            en: Ethics
            fi: Elämänkatsomustieto
            de: Ethik
        icon: /usr/share/icons/oxygen/base/64x64/status/meeting-participant.png
        programs:
            - libreoffice-writer
            - kahoot
            - youtube

  - menu-religion:
        name:
            en: Religion
            fi: Uskonto
            de: Religion
        icon: /usr/share/icons/oxygen/base/64x64/places/user-identity.png
        programs:
            - libreoffice-writer
            - ylearkisto
            - kahoot
            - youtube

# ------------------------------------------------------------------------------

categories:

  - category-main:
        name:
            en: All programs
            fi: Kaikki ohjelmat
            sv: Alla program
            de: Kategorien
        position: 0
        menus:
            - menu-applications
            - menu-graphics
            - menu-internet
            - menu-programming
#            - menu-education
            - menu-office
            - menu-audio
            - menu-games
            - menu-games-personal
#            - menu-abitti
            - menu-whiteboards
#            - menu-web
#        programs:
#            - org.gnome.Nautilus
#            - school-user-list

  - category-subjects:
        name:
            en: Subjects
            fi: Oppiaineet
            sv: Ämnen
            de: Fächer
        position: 1
        menus:
            - menu-deutsch
            - menu-mathematik
            - menu-franzoesisch
            - menu-englisch
            - menu-naturundtechnik
            - menu-medienundprogrammierung
            - menu-raeumezeitengesellschaften
            - menu-musik
            - menu-gestalten' >> /etc/puavomenu/menudata.yaml

exit

