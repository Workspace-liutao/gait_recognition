function [ColVs] = OFColVsSymmetry(BW)
%�õ�����ʸ������
for i=1:length(BW)-1
    [us,vs]=OpticalFlow(BW{i},BW{i+1});
    mus{i}=vs;
end
for k=1:length(mus)
    [row,col]=find(mus{k});
    scol=sort(col);
%ȥ��,ssrowΪ���˶�ʸ����Ϊ�������ɵ�������
    n=2;
    sscol{k}(1)=scol(1);
    for i=2:length(scol)
        if scol(i)==scol(i-1);
        else
            sscol{k}(n)=scol(i);
            n=n+1;
        end
    end
%�����������˶�ʸ����srmus
    for i=1:length(sscol{k})
        srmus{k}(i)=0;
        for j=1:length(col)
            if (sscol{k}(i)==col(j))&&(mus{k}(row(j),col(j))>0)
                srmus{k}(i)=srmus{k}(i)+mus{k}(row(j),col(j));
            end
        end
    end
end
%ʹ��srmusÿ��cell��ά����ͬ
for k=1:length(srmus)
    m(k)=length(sscol{k});
end
maxm=max(m);
for i=1:length(srmus)
    if (maxm-length(srmus{i}))>0
        n=maxm-length(srmus{i});
        for j=length(srmus{i})+1:n+length(srmus{i})
            srmus{i}(j)=0;
        end
    end
end
%���ܵ�srmus
for i=1:maxm
    ColVs(i)=srmus{1}(i);
    for j=2:length(srmus)
        ColVs(i)=ColVs(i)+srmus{j}(i);
    end
end
end

