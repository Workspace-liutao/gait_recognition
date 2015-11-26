function [RowUsVector,RowVsVector,ColUsVector,ColVsVector ] = CellAlignToAverageVector( RowUs0,RowVs0,ColUs0,ColVs0)
for p=1:4
    if p==1
        eigcell=RowUs0;
    elseif p==2
        eigcell=RowVs0;
    elseif p==3
        eigcell=ColUs0;
    else
        eigcell=ColVs0;
    end   
    
    %ά�ȹ���
    eigcell=CellDimensionAlign(eigcell);
    
    %����������������ƽ��ֵ���ɵľ���
    AverageVectorMatrix=AverageCellToMatrix(eigcell);
  
    if p==1
       RowUsVector=AverageVectorMatrix;
    elseif p==2
       RowVsVector=AverageVectorMatrix;
    elseif p==3
       ColUsVector=AverageVectorMatrix;
    elseif p==4
       ColVsVector=AverageVectorMatrix;
    end
end

end

