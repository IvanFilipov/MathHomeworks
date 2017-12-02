
stack = [x,y];

while (length(stack) ~= 0)
  
    newY = stack(end);
    stack(end) = [];
    
    newX = stack(end);
    stack(end) = [];
    
    if(M(newX, newY) == borderValue)
        continue;    
    end
   

   leftX = rightX = newX;
   
   while (leftX > 1 && (M(leftX - 1, newY) ~= borderValue ))
     leftX = leftX - 1;
   end
   
   while ( rightX < MaxX - 1 && (M(rightX + 1 , newY) ~= borderValue))
     rightX = rightX + 1;
   end
 
  if( newY > 1 && newY < MaxY && newX > 1 && newX < MaxX) 
    drawLine;
   end
   
   for nextY = newY - 1 : 2 : newY + 2
      
      if (nextY < MaxY && nextY > 0)
          p1 = M(leftX, nextY);
      else
          p1 = borderValue;      
      end
        
      for x2 = leftX : rightX
        
          if ((x2 + 1 < MaxX) && (nextY < MaxY) && (nextY > 0))
            p2 = M(x2 + 1, nextY);
          else
            p2 = borderValue;      
          end            
          
          if((p1 ~= borderValue) && (p1 ~= fillValue) && (p2 == borderValue))
              stack(end + 1) = x2;
              stack(end + 1) = nextY;          
          end
          
          p1 = p2;
          
      endfor
      
   endfor
   
end
