function [ eigcell ] = CellDimensionAlign( eigcell )
    %��eigcell��ÿ��Ԫ�������ά�ȹ�һ��
    
    x=0;
    for k=1:length(eigcell)
        x(k)=length(eigcell{k});
    end
    maxm=max(x);
    for k=1:length(eigcell)
        if (maxm-length(eigcell{k}))>0
           s=maxm-length(eigcell{k});
           for q=length(eigcell{k})+1:s+length(eigcell{k})
               for n=1:length(size(eigcell{1},1))
                   eigcell{k}(n,q)=0;
               end
           end
        end
    end
end

