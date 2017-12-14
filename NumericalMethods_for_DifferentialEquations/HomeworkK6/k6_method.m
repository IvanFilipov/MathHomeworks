function [y] = k6_method(f, h, eps)
  f_inline = inline(f, 'x1', 'x2');
  
  x = 0:h:1;
  n = size(x)(2);
  y = zeros(n);
  yold = ones(n);
  while(!check(y, yold, eps, n))
    yold = y;
    for i=2:(n-1)
      for j = 2:(n-1)
        fij = feval(f_inline, x(i), x(j));
        y(i,j) = (y(i-1,j) + y(i+1,j) + y(i, j -1) + y(i, j + 1) + (h*h*fij))/4;
      end
    end
  end
end

function [res] = check(y, yold, eps, n)
  res=1;
  for i=2:(n-1)
    for j = 2:(n-1)
      if( abs(y(i,j) - yold(i,j)) >= eps)
        res = 0;
      end
    end
  end
end