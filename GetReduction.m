function [ reduction ] = GetReduction( distinct_matrix,num_attr )
%GETREDUCTION �ӿɱ�ʶ����õ�Լ����
%   �ɱ�ʶ��������������n(n-1)/2����
num_object=size(distinct_matrix,1);
disjunct_item=zeros(num_object*(num_object-1)/2,num_attr);
num_item=0;
for i=1:num_object
    for j=i+1:num_object
        if ~all(distinct_matrix{i,j}==0)
            num_item=num_item+1;
            fprintf('���ַǿ��(%d,%d):',i,j);
            disp(distinct_matrix{i,j});
            disjunct_item(num_item,:)=distinct_matrix{i,j};
        end
    end
end
disjunct_item(num_item+1:num_object*(num_object-1)/2,:)=[];

%--------------��ȡԼ����
reduction=zeros(num_attr*num_item,num_item);
num_reduction=1;
index=ones(num_item,1);
line=1;
num=prod(sum(disjunct_item~=0,2));%�õ�Լ�����
fprintf('���Լ�������%d\n',num);
while num~=0
        for j=index(line,1):num_attr
            if disjunct_item(line,j)~=0
                index(line,1)=j;
                line=line+1;
                break;
            else%���Ԫ��Ϊ0
                if j==num_attr&&line>1
                    index(line,1)=1;
                    line=line-1;
                    index(line,1)= index(line,1)+1;
                end
            end
        end
        if line>num_item%���õ�һ��Լ��
            temp=index';
            for i=1:num_item%ɾ��Լ���ڲ���ͬԪ��
                if temp(1,i)~=0
                    for j=i+1:num_item
                        if temp(1,j)~=0 && temp(1,j)==temp(1,i)
                            temp(1,j)=0;
                        end
                    end
                end
            end
            temp=sort(temp);
            reduction(num_reduction,:)=temp;
            flag=true;
            for k=1:num_reduction-1%�����Ƿ�����ͬ��Լ����������ɾ����ǰ�Ľ��
                if isequal(reduction(k,:),reduction(num_reduction,:))
                    reduction(num_reduction,:)=zeros(1,num_item);
                    flag=false;
                    break;
                end
            end
            if flag,num_reduction=num_reduction+1;end
            num=num-1;
            if num==0,break;end
            line=line-1;
            state=true;
            while  state
                if index(line,1)==num_attr%������λ
                    if line~=1
                        index(line,1)=1;
                        line=line-1;
                    end
                else index(line,1)=index(line,1)+1; state=false;
                end
            end
        end
        
end
reduction(num_reduction:num_attr*num_item,:)=[];
end