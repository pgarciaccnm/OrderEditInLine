({
 	getRecords: function(component, event, helper) {
      // call the apex class method and fetch account list  
         var action = component.get("c.fetchOrder");
        
        	action.setParams({ caseId : component.get("v.recordId") });

             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log('2.1>>>'+JSON.stringify(storeResponse));
               // set AccountList list with return value from server.
                 component.set("v.OrderList", storeResponse);
                 component.set("v.OrderListSize", storeResponse.length)
            } 
            else{
            	alert(response.getState());
            }
        });
        $A.enqueueAction(action);
    }
})