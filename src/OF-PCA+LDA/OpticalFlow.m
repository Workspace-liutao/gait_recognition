function [us,vs]=OpticalFlow(img1,img2) 
%�õ�����ͼ��Ĺ���ͼ
img1=double(img1);
img2=double(img2);

%��ȡͼ��Ա߽���е���
[row,column]=size(img1);  
z=zeros(row,column); 
v1=z;
v2=z;

%��ʼ��
fx=v1;%�ο����ص�ĻҶ�ֵ��x�����ƫ����
fy=v1;%�ο����ص�ĻҶ�ֵ��x�����ƫ����
fz=v1;%�ο����ص�ĻҶ�ֵ��z�����ƫ����
alpha2=625;%��ӳ�����㷨��ƽ����Լ�������Ĳ���
imax=20;%��������

%�����ݶ�
fx =conv2(img1,0.25*[-1 1;-1 1],'same')+conv2(img2,0.25*[-1 1;-1 1],'same');
fy =conv2(img1,0.25*[-1 -1;1 1],'same')+conv2(img2,0.25*[-1 -1;1 1],'same');
fz=conv2(img1,0.25*ones(2),'same')+conv2(img2,-0.25*ones(2),'same');

%������ʸ��
for i=1:imax
   delta=(fx.*v1+fy.*v2+fz)./(alpha2+fx.^2+fy.^2);
   v1=v1-fx.*delta;
   v2=v2-fy.*delta;
end;
u=v1;%�������ʸ��
v=v2;%�������ʸ��

%��������������
d=round(row/50);%d��ʾ��������������֮��ľ���
[hs,ws]=size(u(1:d:row,1:d:column));%hs,ws��ʾ�������ߴ�
us=zeros(hs,ws); vs=us;

%����us,vs�ļ���
N=d^2;
for i=1:hs-1
  for j=1:ws-1
     hk=i*d-d+1;
     hl=i*d;
     wk=j*d-d+1;
     wl=j*d;
     us(i,j)=sum(sum(u(hk:hl,wk:wl)))/N;
     vs(i,j)=sum(sum(v(hk:hl,wk:wl)))/N;
  end
end
