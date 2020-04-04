% clc;clear;
% A=[0,1,0,0,0,0,1,1,0,1;
%     1,0,1,0,0,0,0,0,0,1;
%     0,1,0,1,0,1,0,0,0,0;
%     0,0,1,0,1,1,0,1,0,0;
%     0,0,0,1,0,1,0,0,0,0;
%     0,0,1,1,1,0,1,0,0,0;
%     1,0,0,0,0,1,0,1,1,1;
%     1,0,0,1,0,0,1,0,1,1;
%     0,0,0,0,0,0,1,1,0,1;
%     1,1,0,0,0,0,1,1,1,0];
Dis=Distance(A);
D=MaxD(Dis);
meanD=MeanD(Dis);
C=calC(A);
P=calP(A);
function [Dis]=Distance(A)%ͨ���ڽӾ������������D
sizeA=size(A);
Dis=zeros(sizeA);
num=1;
while(sum(sum(Dis==0))>sizeA(1))
    A_n=A^num;
    [m,n]=find(Dis==0);
    for i=1:length(m)
        %A��num�η���ʹ�ø�λ�ò�Ϊ0ʱ��Ϊ��̾���
       if(m(i)~=n(i) && A_n(m(i),n(i))~=0)
           Dis(m(i),n(i))=num;
           Dis(n(i),m(i))=num;
       end 
    end
    if(num>=sizeA(1))
        [m,n]=find(Dis==0);
        %���ѭ�������������Ȼû�о���ļ�Ϊ�����
        %Ҳ����û��·����ͨ
        for i=1:length(m)
            if(m(i)~=n(i))
                Dis(m(i),n(i))=inf;
                Dis(n(i),m(i))=inf;
            end 
        end
        break;
    end
    num=num+1;
end


end

function [D]=MaxD(Dis)
D=max(max(Dis));
end%����ֱ��

function [L]=MeanD(Dis)%����ƽ������
sizeDis=size(Dis);
L=sum(sum(Dis))/sizeDis(1)^2;
end

function [C]=calC(A)
sizeA=size(A);
sizeA=sizeA(1);
A2=A^2;
A3=A^3;
C=zeros(1,sizeA);
for i=1:sizeA
   C(i)=A3(i,i)/(A2(i,i)*(A2(i,i)-1));
end
end%����ۼ�ϵ��

function [P]=calP(A)%����ȷֲ�
sizeA=size(A);
sizeA=sizeA(1);
p=sum(A);
P=[];
for i=1:sizeA
    P=[P,sum(p<=i)/sizeA]; 
end

end