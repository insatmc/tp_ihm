// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular/angular
//= require_tree .


var app = angular.module("myapp",[]);

app.controller("ctrl",function($scope,$http) {


  $scope.descShow = [];
  $scope.questShow = [];
  $scope.descActive = [];
  $scope.questActive = [];
  $scope.contentShow = [];
  $scope.showDesc = function(id){
    $scope.descShow[id] = "show";
    $scope.questShow[id] = "hide";

  $scope.descActive[id] = "active";
    $scope.questActive[id] = "";
  }

  $scope.showQuest = function(id){
    console.log(id)
    $scope.descShow[id] = "hide";
    $scope.questShow[id] = "show";

  $scope.descActive[id] = "";
    $scope.questActive[id] = "active";
  }

  $scope.showcontent = function(id){
    if ($scope.contentShow[id] == "show") {
      $scope.contentShow[id] = "hide";
    }else{
      $scope.contentShow[id] = "show";
    }
  }


  $http.get("auteurs.json").then(function(json){
    console.log(json);
    $scope.auteurs = json.data;
  });

  $http.get("domaines.json").then(function(json){
    console.log(json);
    $scope.domaines = json.data;
  });

  $http.get("plateforms.json").then(function(json){
    console.log(json);
    $scope.plateforms = json.data;
  });

  $http.get("style_interactions.json").then(function(json){
    console.log(json);
    $scope.styles = json.data;
  });
  
  $scope.catagories = [];

  $http.get("criteres.json").then(function(json){
    console.log(json);
    $scope.allcriteres = json.data;
    $scope.criteres = json.data;
    
    for (var i = 0; i < $scope.criteres.length; i++) {

      $scope.descShow[ $scope.criteres[i].label  ] = "show";
      $scope.questShow [ $scope.criteres[i].label  ] = "hide";
      $scope.descActive[ $scope.criteres[i].label  ] = "active";
      $scope.questActive[ $scope.criteres[i].label  ] ="";
      $scope.contentShow[ $scope.criteres[i].label  ] ="hide";
      console.log($scope.contentShow);

      var test = false;
      for( var j = 0 ; j < $scope.catagories.length ;j++){
        if( $scope.catagories[j].label == $scope.criteres[i].catagorie ){
          console.log("fghjklmùlsd*ùjgojùgqprhpogrg");
          $scope.catagories[j].criteres.push($scope.criteres[i]);
          test = true;
        }
      }
      if (!test) {
        var a = [];
        a.push($scope.criteres[i]);
        $scope.catagories.push({ label: $scope.criteres[i].catagorie, criteres: a });
      };
      
    };
    console.log($scope.catagories);
  });

  $scope.theFilter = {};
  $scope.theFilter.auteur = [];
  $scope.checkAuteurs = function(){
    $scope.theFilter.auteur = [];
    var checkboxs = document.getElementsByClassName("auteurs-checkbox");
    for (var i = checkboxs.length - 1; i >= 0; i--) {
      console.log(checkboxs[i].checked);
      if (checkboxs[i].checked){
        $scope.theFilter.auteur.push(checkboxs[i].value);
        console.log($scope.theFilter);
      };
    };
  }

  $scope.theFilter.plateforms = [];
  $scope.checkPlateforms = function(){
    $scope.theFilter.plateforms = [];
    var checkboxs = document.getElementsByClassName("plateform-checkbox");
    for (var i = checkboxs.length - 1; i >= 0; i--) {
      console.log(checkboxs[i].checked);
      if (checkboxs[i].checked){
        $scope.theFilter.plateforms.push({ label: checkboxs[i].value});
        console.log($scope.theFilter);
      };
    };
    console.log($scope.theFilter.plateforms);
  }

  $scope.theFilter.domaines = [];
  $scope.checkDomaines = function(){
    $scope.theFilter.domaines = [];
    var checkboxs = document.getElementsByClassName("domaine-checkbox");
    for (var i = checkboxs.length - 1; i >= 0; i--) {
      console.log(checkboxs[i].checked);
      if (checkboxs[i].checked){
        $scope.theFilter.domaines.push({ label: checkboxs[i].value});
        console.log($scope.theFilter);
      };
    };
  }

  $scope.theFilter.styles = [];
  $scope.checkStyles = function(){
    $scope.theFilter.styles = [];
    var checkboxs = document.getElementsByClassName("style-checkbox");
    for (var i = checkboxs.length - 1; i >= 0; i--) {
      console.log(checkboxs[i].checked);
      if (checkboxs[i].checked){
        $scope.theFilter.styles.push({ label: checkboxs[i].value});
        console.log($scope.theFilter);
      };
    };
  }

  $scope.selectAll = function(){
    var checkboxs = document.getElementsByClassName("checkbox");
    for (var i = checkboxs.length - 1; i >= 0; i--) {
      checkboxs[i].checked = "checked";
    }
    $scope.checkPlateforms();
    $scope.checkStyles();
    $scope.checkAuteurs();
    $scope.checkDomaines();
  }

  $scope.filterCriteres = function(critere){
    var plateformsTest = false;
    var domainesTest = false;
    var stylesTest = false;
    
    for (var i = $scope.theFilter.plateforms.length - 1; i >= 0; i--) {
      for (var j = critere.plateforms.length - 1; j >= 0; j--) {
        if ( critere.plateforms[j].label == $scope.theFilter.plateforms[i].label ){
          plateformsTest = true;
          break;
        }
      };
      if (plateformsTest) { break; };
    };

    for (var i = $scope.theFilter.domaines.length - 1; i >= 0; i--) {
      for (var j = critere.domaines.length - 1; j >= 0; j--) {
        if ( critere.domaines[j].label == $scope.theFilter.domaines[i].label ){
          domainesTest = true;
          break;
        }
      };
      if (domainesTest) { break; };
    };

    for (var i = $scope.theFilter.styles.length - 1; i >= 0; i--) {
      for (var j = critere.style_interactions.length - 1; j >= 0; j--) {
        if ( critere.style_interactions[j].label == $scope.theFilter.styles[i].label ){
          stylesTest = true;
          break;
        }
      };
      if (stylesTest) { break; };
    };


    return (
      $scope.theFilter.auteur.indexOf(critere.auteur) != -1 &&
      plateformsTest && 
      domainesTest &&
      stylesTest
    )
  }

  $scope.catagorieFilter = function(c){
    var test = false;
    for (var i = c.criteres.length - 1; i >= 0; i--) {
      test = test || $scope.filterCriteres(c.criteres[i]);
    };
    return test;
  }
})