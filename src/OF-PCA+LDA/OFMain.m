function [  ] = OFMain(  )
%���ݿ�
m=5;%m��ʾ��������fds

for i=1:m
    %����ģ�壬���ͬһ�����ڲ�ͬ״̬���л����еķ���ʸ����
    for j=1:3
        if i<10
               fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\00',int2str(i),'\nm-0',int2str(j),'\090\');
               BW1=OFReadpic(fileFolder{i});%BW1��ʾ����i������j�µ�ͼ������
        elseif i<100
               fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\0',int2str(i),'\nm-0',int2str(j),'\090\');
               BW1=OFReadpic(fileFolder{i});
        else 
               fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\',int2str(i),'\nm-0',int2str(j),'\090\');
               BW1=OFReadpic(fileFolder{i});
        end
        [RowUs{j},RowVs{j},ColUs{j},ColVs{j}]=OFSymmetry(BW1);%RowUs{j}��ʾ����i������j���е������˶�ʸ����������RowUs��ÿ��Ԫ������ά�Ȳ�һ
    end
    
    [RowUsMatrix{i},RowVsMatrix{i},ColUsMatrix{i},ColVsMatrix{i}] = EigVector(RowUs,RowVs,ColUs,ColVs);%RowUsMatrix{i}ÿ��Ԫ����ʾ����{i}�ڲ�ͬ����µ�RowUs�γɵ���������
                                                                                   %RowUsMatrix��ÿ��Ԫ������ά�Ȳ�һ
end

    %PCA�ռ�,ProjectRU��ʾRowUs�ռ��ͶӰ����sRowUs��ʾ���ݿ�����ͶӰ�������
    [ProjectRU,sRowUs,ProjectRV,sRowVs,ProjectCU,sColUs,ProjectCV,sColVs]=PcaPlusLda(RowUsMatrix,RowVsMatrix,ColUsMatrix,ColVsMatrix);
 
 
%��������
for i=1:m
    %����ģ�壬���ͬһ�����ڲ�ͬ״̬���л����еķ���ʸ����
    for j=1:2
        if i<10
               fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\00',int2str(i),'\cl-0',int2str(j),'\090\');
               BW1=OFReadpic(fileFolder{i});%BW1��ʾ����i������j�µ�ͼ������
        elseif i<100
               fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\0',int2str(i),'\cl-0',int2str(j),'\090\');
               BW1=OFReadpic(fileFolder{i});
        else 
               fileFolder{i} = strcat('E:\��̬ʶ���о�\��̬ʶ��\���ݿ�\GaitDatasetB-silh\DatasetB\silhouettes\',int2str(i),'\cl-0',int2str(j),'\090\');
               BW1=OFReadpic(fileFolder{i});
        end
        [RowUs0{j},RowVs0{j},ColUs0{j},ColVs0{j}]=OFSymmetry(BW1);
    end
    %�����������ĸ�����ֵ��ȡ����,
    [RowUsMatrix0{i},RowVsMatrix0{i},ColUsMatrix0{i},ColVsMatrix0{i}] = EigVector(RowUs0,RowVs0,ColUs0,ColVs0);
end
    
    %�Բ�ͬ������������ά��У������ƽ��ֵ

    [RowUsVector,RowVsVector,ColUsVector,ColVsVector ] = CellAlignToAverageVector( RowUsMatrix0,RowVsMatrix0,ColUsMatrix0,ColVsMatrix0);
    
    %�����ݿ�����ά�ȹ���
    RowUsVector(:,size(ProjectRU,2)+1)=0;
    RowVsVector(:,size(ProjectRV,2)+1)=0;
    ColUsVector(:,size(ProjectCU,2)+1)=0;
    ColVsVector(:,size(ProjectCV,2)+1)=0;
    for i=1:size(ProjectRU,2)
        RowUsVector0(:,i)=RowUsVector(:,i);
    end
    for i=1:size(ProjectRV,2)
        RowVsVector0(:,i)=RowVsVector(:,i);
    end
    for i=1:size(ProjectCU,2)
        ColUsVector0(:,i)=ColUsVector(:,i);
    end
    for i=1:size(ProjectCV,2)
        ColVsVector0(:,i)=ColVsVector(:,i);
    end
    
%ʶ�����
     sRowUs0=ProjectRU*RowUsVector0';%����ͶӰ
     sRowVs0=ProjectRV*RowVsVector0';
     sColUs0=ProjectCU*ColUsVector0';
     sColVs0=ProjectCV*ColVsVector0';
     [ r1,r2,r3,r4,r] = Recognition(sRowUs,sRowUs0,sRowVs,sRowVs0,sColUs,sColUs0,sColVs,sColVs0);
     r1,r2,r3,r4,r

end

