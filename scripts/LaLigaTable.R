#!/usr/bin/R

# Loading the necessary R packages

Rpackages=c("polite","rvest","kableExtra","gt","svglite")

for (i in Rpackages){install.packages(i)} 

library(polite)
library(tidyverse)
library(rvest)
library(kableExtra)
library(gt)
library(svglite)


url <- 'https://en.wikipedia.org/wiki/2022%E2%80%9323_La_Liga'


session = bow(user_agent = "laliga-Table-Scrape", url)

LaLigaTable <- scrape(session) %>% html_nodes("table.wikitable:nth-child(34)") %>% html_table()


LaLigaTable  <- as.data.frame(LaLigaTable)

names(LaLigaTable)[2] <- "Teams"

WebscrapeTime <- format(Sys.time(), "%A %B %Y, %H:%M:%S (CST)")

LaLigaTable$Badge <- ""

LaLigaTable <- LaLigaTable[,c(1,12,2:11)]

names(LaLigaTable)[12] <- "Qualification/Regulation"

names(LaLigaTable)[11] <- "Pts"


BarcelonaLogo <- "https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg"
RealMadridLogo <- "https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg"
AtleticoMadridLogo <- "https://upload.wikimedia.org/wikipedia/en/f/f4/Atletico_Madrid_2017_logo.svg"
RealSociedadLogo <- "https://upload.wikimedia.org/wikipedia/en/f/f1/Real_Sociedad_logo.svg"
RealBetisLogo <- "https://upload.wikimedia.org/wikipedia/en/1/13/Real_betis_logo.svg"
VillarealLogo <- "https://upload.wikimedia.org/wikipedia/en/b/b9/Villarreal_CF_logo-en.svg"
AthleticBilbaoLogo <- "https://upload.wikimedia.org/wikipedia/en/9/98/Club_Athletic_Bilbao_logo.svg"
RayoVallecanoLogo <- "https://upload.wikimedia.org/wikipedia/en/1/17/Rayo_Vallecano_logo.png"
OsasunaLogo <- "https://upload.wikimedia.org/wikipedia/en/d/db/Osasuna_logo.svg"
GironaLogo <- "https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png"
CeltaVigoLogo <- "https://upload.wikimedia.org/wikipedia/en/1/12/RC_Celta_de_Vigo_logo.svg"
MallorcaLogo <- "https://upload.wikimedia.org/wikipedia/en/e/e0/Rcd_mallorca.svg"
SevillaLogo <- "https://upload.wikimedia.org/wikipedia/en/3/3b/Sevilla_FC_logo.svg"
RealVallodolidLogo <- "https://upload.wikimedia.org/wikipedia/en/c/c5/Shield_of_Real_Valladolid.png"
CadizLogo <- "https://upload.wikimedia.org/wikipedia/en/5/58/C%C3%A1diz_CF_logo.svg"
ValenciaLogo <- "https://upload.wikimedia.org/wikipedia/en/c/ce/Valenciacf.svg"
AlmeriaLogo <- "https://upload.wikimedia.org/wikipedia/en/5/5a/AD_Almer%C3%ADa.png"
ElcheLogo <- "https://upload.wikimedia.org/wikipedia/en/a/a7/Elche_CF_logo.svg"
GetafeLogo <- "https://upload.wikimedia.org/wikipedia/en/4/46/Getafe_logo.svg"
EspanyolLogo <- "https://upload.wikimedia.org/wikipedia/en/d/d6/Rcd_espanyol_logo.svg"


logos <- c(BarcelonaLogo, RealMadridLogo, AtleticoMadridLogo, RealSociedadLogo, RealBetisLogo, VillarealLogo, AthleticBilbaoLogo, RayoVallecanoLogo, OsasunaLogo, 
           GironaLogo, CeltaVigoLogo, MallorcaLogo, GetafeLogo, SevillaLogo, RealVallodolidLogo, EspanyolLogo, CadizLogo, ValenciaLogo, AlmeriaLogo, ElcheLogo)

logolist <- list()


  for(k in 1:20){
    
    for(i in LaLigaTable$Team[k]){
      
      if(i == "Barcelona"){
        logolist <- append(logolist, logos[1])
        
      }else if(i == "Real Madrid"){
        
        logolist <- append(logolist, logos[2])
      }else if(i == "Atlético Madrid"){
        
        logolist <- append(logolist, logos[3])
      }else if(i == "Real Sociedad"){
        
        logolist <- append(logolist, logos[4])
      }else if(i == "Real Betis"){
        
        logolist <- append(logolist, logos[5])
      }else if(i == "Villarreal" ){
        
        logolist <- append(logolist, logos[6])
      }else if(i == "Athletic Bilbao"){
        
        logolist <- append(logolist, logos[7])
      }else if(i == "Rayo Vallecano"  ){
        
        logolist <- append(logolist, logos[8])
      }else if(i == "Osasuna"   ){
        
        logolist <- append(logolist, logos[9])
      }else if(i == "Girona"    ){
        
        logolist <- append(logolist, logos[10])
      }else if(i == "Celta Vigo"  ){
        
        logolist <- append(logolist, logos[11])
      }else if(i == "Mallorca"){
        
        logolist <- append(logolist, logos[12])
      }else if(i == "Getafe" ){
        
        logolist <- append(logolist, logos[13])
      }else if(i == "Sevilla"){
        
        logolist <- append(logolist, logos[14])
      }else if(i == "Cádiz"){
        
        logolist <- append(logolist, logos[15])
      }else if(i == "Valladolid" ){
        
        logolist <- append(logolist, logos[16])
      }else if(i == "Espanyol"  ){
        
        logolist <- append(logolist, logos[17])
      }else if(i == "Valencia" ){
        
        logolist <- append(logolist, logos[18])
      }else if(i == "Almería"  ){
        
        logolist <- append(logolist, logos[19])
      }else if(i == "Elche" ){
        
        logolist <- append(logolist, logos[20])
      }
    }
  }

gt(LaLigaTable) %>% 
  tab_header(
    
    title = html("<img src='https://upload.wikimedia.org/wikipedia/commons/b/bb/LaLiga_Santander_logo_%28stacked%29.svg' style='height:110px'>"),
    subtitle = html("<div style='font-size: 11px; background-color: #F1F1F1; color:black;  font-style:italic'>
    <img src='https://assets.laliga.com/squad/2022/t178/p56764/256x278/p56764_t178_2022_1_001_000.png' class='topstriker' style='height:100px'; 
    <div>
    <img src='https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg' class='topstrikerflag' style='height:90px;' 
    <br></br>
    <i style='font-family: Lato'; font-size:60px>  TOP GOAL SCORER</i>
    <i style='font-family: Lato'; font-size:60px> | ROBERT LEWANDOWSKI | 17 GOALS
    <p style='font-family: Roboto; font-size: 20px; background-color: #F1F1F1; color:black; font-weight:bold; font-style:italic'>LaLiga | Table Standings for the 2022/2023 Season</p>
    </div>
                    
                  </div>")
) %>% cols_align(
  align = "right",
  columns = 7
) %>% cols_align(
  align = "right",
  columns = 8
) %>% cols_align(
  align = "right",
  columns = 9
) %>% cols_align(
  align = "center",
  columns = 10
) %>% cols_align(
  align = "center",
  columns = 11
)  %>%
  tab_options(table.font.size = px(11)) %>%  opt_table_font(
    font = list(
      google_font(name = "Roboto Condensed")
    )
  ) %>% data_color(
    
    columns = "Qualification/Regulation",
    colors = scales::col_factor("Reds", n = 1 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  )%>%  data_color(
    
    columns = "Pld",
    colors = scales::col_numeric("#488A99", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "W",
    colors = scales::col_numeric("#1C4E80", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "D",
    colors = scales::col_numeric("#CED2CC", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "L",
    colors = scales::col_numeric("#AC3E31", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "GF",
    colors = scales::col_numeric("#7E909A", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "GA",
    colors = scales::col_numeric("#A5D8DD", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "Pts",
    colors = scales::col_numeric("Greens", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "GD",
    colors = scales::col_factor("#DBAE58", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "Teams",
    colors = scales::col_factor("#CED2CC", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% data_color(
    
    columns = "Pos",
    colors = scales::col_factor("#CED2CC", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  )%>% data_color(
    
    columns = "Badge",
    colors = scales::col_factor("#CED2CC", n = 2 , domain = NULL),
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
  ) %>% 
  text_transform(
    locations = cells_body(c(Badge)),
    fn = function(x) {
      web_image(url = logolist) 
    }
  ) %>% tab_options(table.font.size = px(12)) %>%
  opt_table_font(
    font = list(
      google_font(name = "Roboto Condensed")
      
    )
  ) %>% tab_options(column_labels.font.size = 11.5, column_labels.font.weight = "bold", data_row.padding = px(5)) %>% tab_source_note(
    source_note = md("*Source: Wikipedia & The LaLiga (Official Website)*")
  )%>% tab_source_note(
    source_note = md(sprintf("Last successful Webscrape time was %s", WebscrapeTime ))
  )  %>% opt_css(
    css = "
      .topstrikerflags {
      border-radius: 80%
    }
    "
  )%>% gtsave(filename = "LaLigaTable.html")