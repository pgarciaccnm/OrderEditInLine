# Order Edit In Line

## This is a simple Lightning component to edit the Order status and Tracking Nubmer fields in line.

## Job Requirement: 
<p> As Operator departement, I wan to manage the orders process through Case process because it provide me a better view of the order process.</p>
<p><strong>Scope of this component</strong></p>
<p>List all Orders who belong to the Case record and allow to edit the Status and Shipping Track Number</p>

## Custom Components
<ul>
  <li>Custom fields<p>Order.CaseId: it's lookup field of Case.Id</p>
  <p>Shipping Tracking Number: It's a text field to enter the tracking number of the order<p>
    </li>
  <li>Aura Components
    <p>OrderLineEdit: It's render every Order<p>
    <ul><li>OrderLineEditController.js</li></ul>
    <p>OrderTableEdit: It's render the all Orders in a Card element</p>
    <ul><li>OrderTableController.js</li></ul>
    
  
  </li>
</ul>

## Issues
