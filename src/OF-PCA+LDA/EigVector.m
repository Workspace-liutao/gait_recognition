function [RowUs1,RowVs1,ColUs1,ColVs1] = EigVector(RowUs,RowVs,ColUs,ColVs)
%��ͬ�����ĸ�����ֵ�ڲ�ͬ����µ������������󻯹���
    for p=1:4
        if p==1
           eigmatrix=RowUs;
        elseif p==2
           eigmatrix=RowVs;
        elseif p==3
           eigmatrix=ColUs;
        else
           eigmatrix=ColVs;
        end    

        %ά�ȹ���
        [eigmatrix] = CellDimensionAlign( eigmatrix );
        
        %����
        eigvector=0;
        for j=1:length(eigmatrix)
            for k=1:length(eigmatrix{1})
                eigvector(j,k)=eigmatrix{j}(k);
            end
        end

        if p==1
           RowUs1=eigvector;%aRowUs��ʾ����i�ڲ�ͬ������е������˶�ʸ����������ƽ��ֵ
        elseif p==2
           RowVs1=eigvector;
        elseif p==3
           ColUs1=eigvector;
        elseif p==4
           ColVs1=eigvector;
        end     
    end
end

