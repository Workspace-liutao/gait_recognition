function [CenterAEI] = Center(AEI)
%��ͼ���Ƶ�ͬһ����

%������
[row,column]=find(AEI);
Coordinates=[row,column];
centroid=mean( Coordinates);
X1=centroid(2);

%ƽ����
b=round(160-X1);
a=0;

%ƽ�ƹ���
se=translate(strel(1),[a,b]);
CenterAEI=imdilate(AEI,se);

end

