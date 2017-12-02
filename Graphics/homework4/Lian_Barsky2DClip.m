
%x1,y1,x2,y2, Xmax , Ymax, Xmin , Ymin

%X1,Y1,X2,Y2

diffX = x2 - x1; 
diffY = y2 - y1;

tin = 0;
tout = 1;

[check, tin, tout] = calcT(diffX, Xmax - x1, tin, tout);

if (check)
  
    [check, tin, tout] = calcT(-diffX, x1 - Xmin, tin, tout);
  
    if(check)
    
        [check, tin, tout] = calcT(diffY, Ymax - y1, tin, tout);
    
          if(check)  
          
                [check, tin, tout] = calcT(-diffY, y1 - Ymin, tin, tout);
                
                 if(check)
                 
                    if(tin > 0)
                        
                        X1 = x1 + tin*diffX;
                        Y1 = y1 + tin*diffY;                    
                    
                    else
                        X1 = x1;
                        Y1 = y1;                         
                    end
                    
                    if(tout < 1)
                    
                   
                        X2 = x1 + tout*diffX;
                        Y2 = y1 + tout*diffY;
                    else
                        
                        X2 = x2;
                        Y2 = y2;                    
                    end
                 
                  %return true
                        
                 end
          end
    end  
end  

