function [ProjectRU,sRowUs,ProjectRV,sRowVs,ProjectCU,sColUs,ProjectCV,sColVs]=PcaPlusLda(RowUsMatrix,RowVsMatrix,ColUsMatrix,ColVsMatrix)
%���PCA+LDAͶӰ�ռ�
%ά�ȹ�һ�����γ���������
for p=1:4
    if p==1
        EigCell=RowUsMatrix;
    elseif p==2
        EigCell=RowVsMatrix;
    elseif p==3
        EigCell=ColUsMatrix;
    else
        EigCell=ColVsMatrix;
    end    
    %ά�ȹ���
    [ EigCell ] = CellDimensionAlign( EigCell );
    
    %����������������ƽ��ֵ���ɵľ���
    [ EigAveMatrix ] = AverageCellToMatrix(EigCell); 
   
    %PCA����
    [PcaProject] = PCA( EigAveMatrix );
        
    %LDA����
    for i=1:length(EigCell)
        EigPcaProject{i}=PcaProject'*EigCell{i}';
    end;
    [ LdaProject ]=LDA(EigPcaProject);
   
    %PCA+LDA�ϲ�
    PLProject=LdaProject'*PcaProject';
    
    if p==1
       ProjectRU=PLProject;%aRowUs��ʾ����i�ڲ�ͬ������е������˶�ʸ����������ƽ��ֵ
       sRowUs=PLProject*EigAveMatrix';
    elseif p==2
       ProjectRV=PLProject;
       sRowVs=PLProject*EigAveMatrix';
    elseif p==3
       ProjectCU=PLProject;
       sColUs=PLProject*EigAveMatrix';
    elseif p==4
       ProjectCV=PLProject;
       sColVs=PLProject*EigAveMatrix';
    end
end
end
