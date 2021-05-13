library(datasets)

server <- function(input, output) {
    
    # Return the requested dataset
    datasetInput <- reactive({
               switch(input$datasetId, "AirPassengers" = AirPassengers,"BJsales"= BJsales,"BJsales.lead"=BJsales.lead,
               "BOD" = BOD, "CO2"=CO2, "ChickWeight"=ChickWeight, "DNase"=DNase, "EuStockMarkets"=EuStockMarkets,
               "Formaldehyde"=Formaldehyde, "HairEyeColor"=HairEyeColor, "Harman23.cor"=Harman23.cor, "Harman74.cor"=Harman74.cor,
               "Indometh"=Indometh, "InsectSprays"=InsectSprays, "JohnsonJohnson"=JohnsonJohnson, "LakeHuron"=LakeHuron,
               "LifeCycleSavings"=LifeCycleSavings, "Loblolly"=Loblolly, "Nile"=Nile, "Orange"=Orange, "Orchardsorays"=OrchardSprays,
               "PlantGrowth"=PlantGrowth, "Puromycin"=Puromycin, "Seatbelts"=Seatbelts,"Theoph"=Theoph, "Titanic"=Titanic,
               "ToothGrowth"=ToothGrowth, "UCBAdmissions"=UCBAdmissions, "UKDriverDeaths"=UKDriverDeaths, "UKgas"=UKgas,
               "USAccDeaths"=USAccDeaths, "USArrests"=USArrests, "USJudgeRatings"=USJudgeRatings, "USPersonalExpenditure"=USPersonalExpenditure,
               "UScitiesD" = UScitiesD, "VADeaths"=VADeaths,"WWWusage"=WWWusage, "WorldPhones"=WorldPhones, "ability.cov"=ability.cov,
               "airmiles"=airmiles, "airquality"=airquality, "pressure" = pressure,"anscombe"=anscombe, "attenu"=attenu,
               "attitude"=attitude, "austres"=austres, "beaver1"=beaver1, "beaver2"=beaver2,
               "cars" = cars, "chickwts"=chickwts, "co2"=co2, "crimtab"=crimtab, "discoveries"=discoveries, "esoph"=esoph,
               "euro"=euro, "euro.cross"=euro.cross, "eurodist"=eurodist, "faithful"=faithful, "fdeaths"=fdeaths,
               "freeny"=freeny, "freeny.x"=freeny.x, "freeny.y"=freeny.y, "infert"=infert,
               "iris"=iris, "iris3"=iris3, "islands"=islands, "ldeaths"=ldeaths, "lh"=lh, "longley"=longley,
               "lynx"=lynx, "mdeaths"=mdeaths, "morley"=morley, "mtcars"=mtcars, "nhtemp"=nhtemp,
               "nottem"=nottem, "npk"=npk, "occupationalStatus"=occupationalStatus,"precip"=precip, "presidents"=presidents,
               "pressure"=pressure, "quakes"=quakes, "randu"=randu, "rivers"=rivers, "rock"=rock, "sleep"=sleep,
               "stack.loss"=stack.loss, "stack.x"=stack.x, "stackloss"=stackloss,
               "state.abb"=state.abb, "state.area"=state.area, "state.center"=state.center,
               "state.division"=state.division, "state.name"=state.name, "state.region"=state.region,
               "state.x77"=state.x77, "sunspot.month"=sunspot.month, "sunspot.year"=sunspot.year, "sunspots"=sunspots,
               "swiss"=swiss, "treering"=treering, "trees"=trees, "uspop"=uspop, "volcano"=volcano, "warpbreaks"=warpbreaks,
               "women"=women
               )
    })
   
    
    # Title of the dataset
    output$Title <- renderPrint({
        dat <- as.data.frame(data(package = "datasets")$results)
        #dat <- as.data.frame(datasets$results)
        dat[dat$Item==input$datasetId,c(4)]
    })
    
    # Summary of the dataset
    output$summary <- renderPrint({
        datasetId <- datasetInput()
        summary(datasetId)
    })
    
    # The first n observations
    output$view <- renderTable({
        head(datasetInput(), n = input$obs)
    })
    
}