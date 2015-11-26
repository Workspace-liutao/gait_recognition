function [RowUs,RowVs,ColUs,ColVs] = OFSymmetry( BW )
%�õ�ĳ����ĳ��״̬���е����¡������˶�ʸ���ͣ��е����¡������˶�ʸ�����ĸ�����������

L=length(BW)-1;%����ͼ������

%�õ�����ʸ������
for i=1:L
    [us,vs]=OpticalFlow(BW{i},BW{i+1});
    mus{i}=us;
    mvs{i}=vs;
end

%RowUs,ColUs�����ĺ�
for m=1:length(mus)
    [row,col]=find(mus{m});
    srow=sort(row);
    scol=sort(col);
    
    %rowUs
    %��ȥ��,ssrowΪ�����˶�ʸ����Ϊ����к���ɵ�������
    n=2;
    ssrow(1)=srow(1);
    for i=2:length(srow)
        if srow(i)==srow(i-1);
        else
           ssrow(n)=srow(i);
           n=n+1;
        end
    end

    %RowUs()Ϊ�е������˶�ʸ����
    for i=ssrow(1):ssrow(length(ssrow))
        r=i+1-ssrow(1);
        RowUs1{m}(r)=0;  
        for q=1:length(ssrow)
                if i==ssrow(q)
                    for j=1:length(row)
                        if (i==row(j))&&(mus{m}(row(j),col(j))<0)
                           RowUs1{m}(r)=RowUs1{m}(r)+mus{m}(row(j),col(j));
                        end
                    end
                end
        end
        RowUs1{m}(r)=-RowUs1{m}(r);%ȡ��
    end
    
    %colUs
    %��ȥ��,sscolΪ�����˶�ʸ����Ϊ����к���ɵ�������
    n=2;
    sscol(1)=scol(1);
    for i=2:length(scol)
        if scol(i)==scol(i-1);
        else
           sscol(n)=scol(i);
           n=n+1;
        end
    end

    %ColUs()Ϊ�е������˶�ʸ����
    for i=sscol(1):sscol(length(sscol))
        r=i+1-sscol(1);
        ColUs1{m}(r)=0;  
        for q=1:length(sscol)
                if i==sscol(q)
                    for j=1:length(col)
                        if (i==col(j))&&(mus{m}(row(j),col(j))<0)
                           ColUs1{m}(r)=ColUs1{m}(r)+mus{m}(row(j),col(j));
                        end
                    end
                end
        end
        ColUs1{m}(r)=-ColUs1{m}(r);
    end
end

%���������˶�������
for k=1:length(mus)
    mm(k)=length(RowUs1{k});
    nn(k)=length(ColUs1{k});
end
maxm=max(mm);
maxn=max(nn);
for k=1:maxm
    RowUs(k)=0;
    for j=1:length(mus)
        if k>length(RowUs1{j})
            RowUs(k)=RowUs(k);
        else
            RowUs(k)=RowUs(k)+RowUs1{j}(k);
        end
    end
end
for k=1:maxn
    ColUs(k)=0;
    for j=1:length(mus)
        if k>length(ColUs1{j})
            ColUs(k)=ColUs(k);
        else
            ColUs(k)=ColUs(k)+ColUs1{j}(k);
        end
    end
end


%RowVs,ColVs�����ĺ�
for m=1:length(mvs)
    [row,col]=find(mvs{m});
    srow=sort(row);
    scol=sort(col);
    
    %rowVs
    %��ȥ��,ssrow1Ϊ�����˶�ʸ����Ϊ����к���ɵ�������
    n=2;
    ssrow1(1)=srow(1);
    for i=2:length(srow)
        if srow(i)==srow(i-1);
        else
           ssrow1(n)=srow(i);
           n=n+1;
        end
    end

    %RowVs()Ϊ�е������˶�ʸ����
    for i=ssrow1(1):ssrow1(length(ssrow1))
        r=i+1-ssrow1(1);
        RowVs1{m}(r)=0;  
        for q=1:length(ssrow1)
                if i==ssrow1(q)
                    for j=1:length(row)
                        if (i==row(j))&&(mvs{m}(row(j),col(j))<0)
                           RowVs1{m}(r)=RowVs1{m}(r)+mvs{m}(row(j),col(j));
                        end
                    end
                end
        end
        RowVs1{m}(r)=-RowVs1{m}(r);
    end
    
    %colVs
    %��ȥ��,sscol1Ϊ�����˶�ʸ����Ϊ����к���ɵ�������
    n=2;
    sscol1(1)=scol(1);
    for i=2:length(scol)
        if scol(i)==scol(i-1);
        else
           sscol1(n)=scol(i);
           n=n+1;
        end
    end

    %ColVs()Ϊ�е������˶�ʸ����
    for i=sscol1(1):sscol1(length(sscol1))
        r=i+1-sscol1(1);
        ColVs1{m}(r)=0;  
        for q=1:length(sscol1)
                if i==sscol1(q)
                    for j=1:length(col)
                        if (i==col(j))&&(mvs{m}(row(j),col(j))<0)
                           ColVs1{m}(r)=ColVs1{m}(r)+mvs{m}(row(j),col(j));
                        end
                    end
                end
        end
        ColVs1{m}(r)=-ColVs1{m}(r);
    end
end

%���������˶�������
for k=1:length(mvs)
    mm1(k)=length(RowVs1{k});
    nn1(k)=length(ColVs1{k});
end
maxm=max(mm1);
maxn=max(nn1);
for k=1:maxm
    RowVs(k)=0;
    for j=1:length(mvs)
        if k>length(RowVs1{j})
            RowVs(k)=RowVs(k);
        else
            RowVs(k)=RowVs(k)+RowVs1{j}(k);
        end
    end
end
for k=1:maxn
    ColVs(k)=0;
    for j=1:length(mvs)
        if k>length(ColVs1{j})
            ColVs(k)=ColVs(k);
        else
            ColVs(k)=ColVs(k)+ColVs1{j}(k);
        end
    end
end

end





