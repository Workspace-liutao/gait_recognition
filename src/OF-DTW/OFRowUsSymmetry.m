function [RowUs] = OFRowUsSymmetry(BW)
%�õ�����ʸ������
for i=1:length(BW)-1
    [us,vs]=OpticalFlow(BW{i},BW{i+1});
    mus{i}=us;
end
for k=1:length(mus)
    [row,col]=find(mus{k});
    srow=sort(row);
%ȥ��,ssrowΪ���˶�ʸ����Ϊ�������ɵ�������
    n=2;
    ssrow{k}(1)=srow(1);
    for i=2:length(srow)
        if srow(i)==srow(i-1);
        else
            ssrow{k}(n)=srow(i);
            n=n+1;
        end
    end
%�����������˶�ʸ����srmus
    for i=1:length(ssrow{k})
        srmus{k}(i)=0;
        for j=1:length(row)
            if (ssrow{k}(i)==row(j))&&(mus{k}(row(j),col(j))>0)
                srmus{k}(i)=srmus{k}(i)+mus{k}(row(j),col(j));
            end
        end
    end
end
%ʹ��srmusÿ��cell��ά����ͬ
for k=1:length(srmus)
    m(k)=length(ssrow{k});
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
    RowUs(i)=srmus{1}(i);
    for j=2:length(srmus)
        RowUs(i)=RowUs(i)+srmus{j}(i);
    end
end
end

