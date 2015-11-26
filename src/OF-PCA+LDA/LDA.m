function    [ W ]=LDA( D ) 
%LDA����
%D����n��Ԫ�����飬ÿ������ixj�ľ������NΪLDA���ͶӰ����

%ת��
for i=1:length(D)
    X{i}=D{i}';
end

%����������������ƽ��ֵ���ɵľ���,mλ�����ڲ�ͬ�����ƽ��ֵ�γɵľ���
[ m ] = AverageCellToMatrix(X); 

%������ƽ��ֵM
M(size(m,2))=0;
for i=1:size(m,2)
    for j=1:size(m,1)
        M(i)=M(i)+m(j,i);
    end
end
M=M/size(m,1);

%�ܵ�����ɢ������
s(length(size(D{1},2)),length(size(D{1},2)))=0;
Sw=s;
for i=1:length(X)
    for j=1:size(X{i},1)
        s=s+(X{i}(j,:)-m(j,:))'*(X{i}(j,:)-m(j,:));
    end
    Sw=Sw+s;
end

%�ܵ����ɢ������
Sb(length(size(D{1},2)),length(size(D{1},2)))=0;
for i=1:length(X)
    Sb=Sb+size(X{i},1)*(m(i,:)-M)'*(m(i,:)-M);
end

%W��ÿһ��Ϊ�ԽǾ���E������ֵ��Ӧ����������
[W,E]=eig((inv(Sw))*Sb);



end

