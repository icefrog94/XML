xquery version "1.0";


(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Additional Case Problem

   Query to display summary information about orders from
   The Zocalo Fire Pit.

   Author:     
   Date:       

   Filename:   zfp_query1.xq

 :)


<results>{
   for $c in doc('zfpcustomers.xml')//customer 
   for $o in doc('zfporders.xml')//order

  let $total := sum($o/products/product/(@qty*@price))  
      where $total >= 200 
                and $o/custID=$c/@custID  
    order by $total descending
  return
  <members>
    <orderTotal>{      
        concat("$",round-half-to-even($total,2))    
     }</orderTotal>
    <member>      
     {$c}    
    </member>
  </members>
}</results>