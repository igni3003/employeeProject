console.log("departments Module......");
var deptService = (function() {



  function getDeptList(callback, error){
    $.getJSON( 
      "/rest/department.json",
      function(data){ 
        if(callback){
          callback(data);
        }
      }
    ).fail(function(xhr, status, err){
      if(error){
        error(err);
      }
    });
  }

  function getDeptTitleList(dept_no, callback, error){
    $.getJSON( 
      "/rest/department/titles/"+dept_no+".json",
      function(data){ 
        if(callback){
          callback(data);
        }
      }
    ).fail(function(xhr, status, err){
      if(error){
        error(err);
      }
    });
  }

  
  function getDeptEmpList(emp_no, callback, error){
    $.getJSON( 
      "/rest/department/employee/" + emp_no + ".json",
      function(data){ 
        if(callback){
          callback(data);
        }
      }
    ).fail(function(xhr, status, err){
      if(error){
        error(err);
      }
    });
  }

  function getTitleList(emp_no, callback, error){
    $.getJSON( 
      "/rest/department/employee/titles/" + emp_no + ".json",
      function(data){ 
        if(callback){
          callback(data);
        }
      }
    ).fail(function(xhr, status, err){
      if(error){
        error(err);
      }
    });
  }
  
  function displayTime(timeValue){
    var today = new Date();
    var gap = today.getTime() - timeValue;
    var dateObj = new Date(timeValue);

    if(gap < (1000 * 60 * 60 * 24)){
      var hh = dateObj.getHours();
      var mi = dateObj.getMinutes();
      var ss = dateObj.getSeconds();
      return [
        (hh>9?'':'0')+hh, ':', 
        (mi>9?'':'0')+mi, ':',
        (ss>9?'':'0')+ss
      ].join('');
    } else {
      var yy = dateObj.getFullYear();
      var mm = dateObj.getMonth() + 1;
      var dd = dateObj.getDate();
      return [
        yy, '/', (mm>9?'':'0') + mm, 
        '/', (dd>9?'':'0') + dd
      ].join('');
    }
   }

  return  { 
    getDeptList : getDeptList ,
    getDeptTitleList : getDeptTitleList ,
    getDeptEmpList:getDeptEmpList,
    getTitleList:getTitleList,
    displayTime : displayTime
  };

})();