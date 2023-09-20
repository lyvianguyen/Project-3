let url = "https://data.cdc.gov/api/views/bi63-dtpu/rows.json?accessType=DOWNLOAD";

//url = "http://127.0.0.1:5000/api/v1.0./Alabama/2005/Stroke"
var fulldata=[];
states=[];
causeOfDeath = [];
causeOfDeathCategory=[];
year=[];
deaths =[];

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


function unique(array){
    let returner = new Set(array);
    return  Array.from(returner);
}
function filterByYearAndCOD(){
    let currentYear = yearDropdown.value;
    let currentCOD = codDropdown.value;
    let url = `http://127.0.0.1:5000/api/v1.0./${currentYear}/${currentCOD}`;
    d3.json(url).then (function(data){
       alert(url);
    });

}

    

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
  
