#
# Ajandekvalasztas App
# 2019, YOUnik

setwd("C:/Users/Nandi/Documents/younik/app/")

if(!require("pacman")) install.packages(pacman)
p_load("shiny")

egyetertes_skala <- c("egyaltalan nem ertek egyet" = 1,
                                "nagyon nem ertek egyet" = 2,
                                "nem ertek egyet" = 3,
                                "inkabb nem ertek egyet" = 4,
                                "inkabb egyetertek" = 5,
                                "egyetertek" = 6,
                                "nagyon egyetertek" = 7,
                                "teljes mertekben egyetertek" = 8)
# Define UI ----
ui <- fluidPage(
  
  title = "Melyik ajandek illik hozzad?",
  
  column(3, #offset = 1,
         selectInput('Nem', 'Nem', choices = c("ferfi" = 0, "No" = 1)),
         sliderInput('Eletkor', 'Eletkor', 
                     min=1, max=120, value=18, step=1),
         selectInput('Lakohely', 'Lakohely',
                    choices= c("Falu/kozseg" = 0, "Varos" = 1,
                              "Megyeszekhely" = 2, "Fovaros" = 3)),
         selectInput('vegzettseg', 'Legmagasabb iskolai vegzettseg',
                     choices = c("8 altalanos" = 0, "szakmunkaskepzo" = 1,
                      "szakkozepiskolai erettsegi" = 2, "gimnaziumi erettsegi"=3,
                      "foiskola/BA/BSc" = 4, "egyetem/MA/MSc" = 5, "doktori/PhD"=6)),
         selectInput('jovedelem', 'Havi netto jovedelem',
                     choices = c("78 000 Ft alatt" = 0,
                      "78 000 Ft és 124 000 Ft kozott" = 1,
                      "125 000 Ft es 187 000 Ft kozott" = 2,
                      "188 000 Ft es 312 000 Ft kozott" = 3,
                      "312 000 Ft folott" = 4))
  ),
  
  column(3, #offset = 1,
         selectInput('v1', 'Vonzanak az ujabb és ujabb elmenyek.',
                     choices = egyetertes_skala),
         selectInput('v10', 'Osszessegeben elegedett vagyok magammal.',
                     choices = egyetertes_skala),
         selectInput('v16', 'Az atlagosnal jobban erdekelnek a targyak.',
                     choices = egyetertes_skala),
         selectInput('v21', 'Szeretek diszitgetni.',
                     choices = egyetertes_skala),
         selectInput('v22', 'Szeretem, ha megmutathatom masoknak magamat.',
                     choices = egyetertes_skala),
         selectInput('v26', 'Nem vagyok olyan, mint amilyen szeretnek lenni.',
                     choices = egyetertes_skala),
         selectInput('v27', 'Szivesen dolgozom nyersanyagokkal, hogy valami ujat alkossak.',
                     choices = egyetertes_skala)
  ),
  
  column(3, #offset = 1,
         selectInput('v2', 'Nyitott vagyok olyan dolgokra is, amik korabban nem erdekeltek.',
                     choices = egyetertes_skala),
         selectInput('v17', 'Erdekelnek az idegen kulturak.',
                     choices = egyetertes_skala),
         selectInput('v20', 'Egy esemeny nelkulem unalmasabb lenne.',
                     choices = egyetertes_skala),
         selectInput('v29', 'Elegedett vagyok azzal, amit a tukorben latok.',
                     choices = egyetertes_skala),
         selectInput('v30', 'Nehezen valok meg dolgoktol.',
                     choices = egyetertes_skala),
         selectInput('v31', 'Inkabb a targyi dolgok erdekelnek.',
                     choices = egyetertes_skala)
  ),
  
  column(3, #offset = 1,
         selectInput('v3', 'Szeretem a kiszamithatosagot.',
                     choices = egyetertes_skala),
         selectInput('v9', 'Szeretek elore tervezni.',
                     choices = egyetertes_skala),
         selectInput('v15', 'Ugy erzem, altalaban en felelek a jo hangulatert a tarsasagban.',
                     choices = egyetertes_skala),
         selectInput('v18', 'Szeretek olyasmivel foglalkozni, ami soran uj,
                     szamomra ismeretlen dolgokat ismerhetek meg.',
                     choices = egyetertes_skala),
         selectInput('v33', 'Szeretek ujat alkotni.',
                     choices = egyetertes_skala),
         selectInput('v37', 'Szeretem elore tudni a heti programomat.',
                     choices = egyetertes_skala)
         ),
  actionButton("Action", "Submit"),
  
  mainPanel(
    imageOutput("image")
    )
)
