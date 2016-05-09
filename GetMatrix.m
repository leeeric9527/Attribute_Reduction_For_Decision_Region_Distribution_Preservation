function [ distinct_matrix ] = GetMatrix( decision_table,distinct_value_matrix )
%GETMATRIX �����ѵõ������ֱ�׼ֵdistinct_value_matrix�����ɱ�ʶ����
% disp(decision_table);
% disp(distinct_value_matrix);
num_condition_attr=size(decision_table,2)-1;%�������Եĸ���
num_object=size(decision_table,1);%���󣨼�¼���ĸ���
distinct_matrix=cell(num_object,num_object);
for i=1:num_object
    for j=i+1:num_object
        differ=zeros(1,num_condition_attr);
        if ~isequal(distinct_value_matrix(i,:),distinct_value_matrix(j,:))%�������ֵ��һ��
            for k=1:num_condition_attr%���㲻ͬ������
                if decision_table(i,k)~=decision_table(j,k)
                    differ(k)=k;
                end
            end
        end
        distinct_matrix{i,j}=differ;
    end
end
end

