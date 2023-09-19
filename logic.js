let url = "https://data.cdc.gov/api/views/bi63-dtpu/rows.json?accessType=DOWNLOAD";
var fulldata=[];
states=[];
causeOfDeath = [];
causeOfDeathCategory=[];
year=[];
deaths =[];

let statesDropdown = document.getElementById("states");
let yearDropdown = document.getElementById("year");
let codDropdown = document. getElementById("COD");

d3.json(url).then (function(data){

    for(i=0; i<data.data.length; i++){
    
            states.push(data.data[i][11]);
            causeOfDeath.push(data.data[i][9]);
            causeOfDeathCategory.push(data.data[i][10]);
            fulldata.push(data.data[i]);
            year.push(data.data[i][8]);

    }
   uniqueStates = unique(states);
    for(i =0; i<uniqueStates.length; i++){
        let option = document.createElement("option");
        option.textContent = uniqueStates[i];
        option.value = uniqueStates[i];
        statesDropdown.appendChild(option);
    }
    uniqueYears= unique(year);
    for(i =0; i<uniqueYears.length; i++){
        let option = document.createElement("option");
        option.textContent = uniqueYears[i];
        option.value = uniqueYears[i];
        yearDropdown.appendChild(option);
    }
    uniqueCOD = unique(causeOfDeathCategory);
    for(i =0; i<uniqueCOD.length; i++){
        let option = document.createElement("option");
        option.textContent = uniqueCOD[i];
        option.value = uniqueCOD[i];
        codDropdown.appendChild(option);
    }
    //console.log(data.data);
    
});

function filterByYear(year){
    returner =[]
    d3.json(url).then (function(data){
       for (i =0; i<data.data.length; i++){
        if (data.data[i][8]===year){
            returner.push(data.data[i]);
            
        }
       }
       
       
    });
    console.log(returner);
}
function filterByState(state){
    returner=[];
    d3.json(url).then (function(data){
        for (i =0; i<data.data.length; i++){
         if (data.data[i][11]===state){
             returner.push(data.data[i]);
             
         }
        }
        
        
     });
     console.log(returner);

}
function filterByCOD(COD){
    returner =[];
    //d3.json(url).then (function(data){
        //fulldata= data.data;
        for (i =0; i<fulldata.length; i++){
         if (fulldata[i][10]===COD){
            alert("yes");
             //returner.push(fulldata[i]);
             
         }
        }
        
        
     //});
    console.log(fulldata);
    console.log(returner);

}

function unique(array){
    let returner = new Set(array);
    return  Array.from(returner);
}



    
filterByCOD("Cancer");

//console.log(fulldata);

// Creating the map object
let myMap = L.map("map", {
    center: [39.8, -96],
    zoom: 4
  });
  
  // Adding the tile layer
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(myMap);
  
