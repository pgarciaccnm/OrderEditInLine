({

    hasDelivery: function(component, event, helper) {
      // call the apex class method and fetch account list  
      	//var getOrderItem = JSON.stringify(component.get('v.singleRec'));
        
        var getOrderItem = component.get('v.singleRec');
        
        
        var getShippingExpressFields = JSON.stringify(component.get('v.shippingExpressFields'));
        
        var getShippingRegularFields = JSON.stringify(component.get('v.shippingRegularFields'));
        
        var getNotShippingFields = JSON.stringify(component.get('v.notShippingFields'));
        
        if(JSON.stringify(getOrderItem).search('Regular Delivery') > 0){
            
            component.set('v.fields',component.get('v.shippingRegularFields'));
        }
        else if(JSON.stringify(getOrderItem).search('Unofficial') > 0){
            
            component.set('v.fields',component.get('v.notShippingFields'));
        }
            else{
                component.set('v.fields',component.get('v.shippingExpressFields'));
            }
         //alert(JSON.stringify(getOrderItem));
        //alert(JSON.stringify(getOrderItem).search('Unofficial '));
        

        	
        //$A.enqueueAction(action);
    }
})