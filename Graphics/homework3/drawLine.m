for i = leftX : rightX
      M(i,newY) = fillValue;
      rectangle('Position',[i-1,newY-1,1,1],'FaceColor',colFill);
      pause(0.01);
end