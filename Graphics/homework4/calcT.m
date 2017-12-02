## Copyright (C) 2017 Vanaka
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} calcT (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Vanaka <Vanaka@VANAKA-PC>
## Created: 2017-11-25

function [isInside, tin, tout] = calcT (R, Q, tin, tout)

  if (R > 0)
    
      t = Q / R;
    
      if  (t < tin)   
        isInside = 0;
        return;
      end    
      
      tout = min(t, tout);
      
  else
      
      if (R < 0)
          
          t = Q / R;
          
          if( t > tout)
            isInside = 0;
            return;
          end
          
          tin = max(t, tin);
      else
      
          if( Q < 0 )
              isInside = 0;
              return;
          end
          
      end
   end

  isInside = 1;   
endfunction
