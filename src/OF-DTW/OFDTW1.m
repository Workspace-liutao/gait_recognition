function [ ] = OFDTW1( )
%DTW�㷨ƥ��ʶ�����
m=5;%ģ����������
for i=1:m;
%���ͬһ�����ڲ�ͬ״̬���л����е�ĳһ����ʸ����
  for j=1:6
    if i<10
        fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\00',int2str(i),'\nm-0',int2str(j),'\090\');
        BW1=OFReadpic(fileFolder{i});
    elseif i<100
         fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\0',int2str(i),'\nm-0',int2str(j),'\090\');
         BW1=OFReadpic(fileFolder{i});
    else 
         fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\',int2str(i),'\nm-0',int2str(j),'\090\');
        BW1=OFReadpic(fileFolder{i});
    end
    RowUs11{j}=OFRowVsSymmetry(BW1);%RoWUs11��ʾ����i��״̬j��ÿ������Ĺ���ʸ���͵�����
  end
  %RowUs11�ĳ��ȹ���
  for k=1:length(RowUs11)
      x(k)=length(RowUs11{k});
  end
  maxm=max(x);
  for n=1:length(RowUs11)
    if (maxm-length(RowUs11{n}))>0
        p=maxm-length(RowUs11{n});
        for q=length(RowUs11{n})+1:p+length(RowUs11{n})
            RowUs11{n}(q)=0;
        end
    end
  end
  %RowUs1Ϊͬһ���˲�ͬ״̬�µ�ʸ���͵���
 for k=1:length(RowUs11{1})
     RowUs1{i}(k)=0;
     for j=1:length(RowUs11)
         RowUs1{i}(k)=RowUs1{i}(k)+RowUs11{j}(k);
     end
 end
 %��RowUs1��ƽ��ֵ
 for k=1:length(RowUs11{1})
     RowUs1{i}(k)=RowUs1{i}(k)/length(RowUs11);
 end
end
%�����������л����е�ͬһ����ʸ����
for i=1:m
    for j=1:2
    if i<10
         fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\00',int2str(i),'\cl-0',int2str(j),'\090\');
        BW2=OFReadpic(fileFolder{i});
    elseif i<100
         fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\0',int2str(i),'\cl-0',int2str(j),'\090\');
         BW2=OFReadpic(fileFolder{i});
    else 
         fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\',int2str(i),'\cl-0',int2str(j),'\090\');
        BW2=OFReadpic(fileFolder{i});
    end
    RowUs22{j}=OFRowVsSymmetry(BW2);%RoWUs11��ʾ����i��״̬j��ÿ������Ĺ���ʸ���͵�����
  end
  %RowUs11�ĳ��ȹ���
  for k=1:length(RowUs22)
      x(k)=length(RowUs22{k});
  end
  maxm=max(x);
  for n=1:length(RowUs22)
    if (maxm-length(RowUs22{n}))>0
        p=maxm-length(RowUs22{n});
        for q=length(RowUs22{n})+1:p+length(RowUs22{n})
            RowUs22{n}(q)=0;
        end
    end
  end
  %RowUs1Ϊͬһ���˲�ͬ״̬�µ�ʸ���͵���
 for k=1:length(RowUs22{1})
     RowUs2{i}(k)=0;
     for j=1:length(RowUs22)
         RowUs2{i}(k)=RowUs2{i}(k)+RowUs22{j}(k);
     end
 end
 %��RowUs1��ƽ��ֵ
 for k=1:length(RowUs22{1})
     RowUs2{i}(k)=RowUs2{i}(k)/length(RowUs22);
 end
end
%DTWƥ��������
for i=1:m
    for j=1:m
        dist(i,j)=DTW(RowUs1{i},RowUs2{j});
    end
end
dist
%ʶ���ʼ������
w=0;%w����ƥ��ɹ���
for i=1:m
    n=0;
    for j=1:m
        if dist(i,i)>dist(j,i)
            break
        else
            n=n+1;
        end
    end
    if n==m
        w=w+1;
    end
end
w=w/m
end

