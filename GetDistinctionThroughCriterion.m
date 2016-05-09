function [ decision_table,distinct_value_matrix ] = GetDistinctionThroughCriterion( decision_table )
%GETDISTINCTIONTHROUGHCRITERION �˴�Ϊ��������ֱ�׼������ֵ�Ƿ����
%   ���ؾ���ֵ����
%   ������߱���Լ��
%   �����������ݽṹ
%   C_value | num_decision_value | decision_value
%   decision_table=[C_value , decision_value];
num_object=size(decision_table,1);%��¼�������
num_attr=size(decision_table,2);%��¼���Եĸ���
decision_value=zeros(1,num_object);%��ȡ����ֵ�ľ���
num_dec_value=0;%��¼����ȡֵ����

for i=1:num_object%�����������ȡֵ�ĸ���
    flag=true;%��¼��ǰ����ȡֵ�Ƿ��Ѿ�����¼��trueΪδ��¼
    for j=1:num_dec_value
        if decision_table(i,num_attr)==decision_value(j)
            flag=false;
            break;
        end
    end
    if flag,num_dec_value=num_dec_value+1;decision_value(num_dec_value)=decision_table(i,num_attr);end
end
value=decision_value(1,1:num_dec_value);
num_cond=num_attr-1;%����������Ŀ
decision_value=zeros(num_object,num_dec_value);%��ȡ����ֵ�ľ���
dec_value_object_num=zeros(num_object,num_dec_value);%��ȡȡ��ֵ����Ŀ
num_dec_value=zeros(1,num_object);%��ȡ��������ȡֵ����Ŀ
cond_value=zeros(num_object,num_attr-1);%��ȡ�������Ե�����ֵ
num_cond_value=0;%��¼��������ֵ�ĸ���
for i=1:num_object
    flag=true;%��¼��ǰ������������ȡֵ�Ƿ��Ѿ�����¼��trueΪδ��¼
    for j=1:num_cond_value
        if cond_value(j,:)==decision_table(i,(1:num_cond))%�Ѿ�����¼
            %���¾���ֵȡֵ�;���ֵȡֵ��Ŀ
            state=true;%��¼��ǰ�����������ȡֵ�Ƿ��Ѿ�����¼��trueΪδ��¼
            for k=1:num_dec_value(j)
                if decision_value(j,k)==decision_table(i,num_attr)%����ֵ�Ѿ�����¼
                    dec_value_object_num(j,k)=dec_value_object_num(j,k)+1;
                    state=false;
                    break;
                end
            end
            if state%�������ֵû�б���¼
                num_dec_value(j)=num_dec_value(j)+1;
                decision_value(j,num_dec_value(j))=decision_table(i,num_attr);
                dec_value_object_num(j,num_dec_value(j))=1;%ȡֵ��������1
            end
            flag=false;
            break;
        end
    end
    if flag%�����ǰ��������ֵû�б���¼����
        %�����������
        num_cond_value=num_cond_value+1;
        cond_value(num_cond_value,:)=decision_table(i,(1:num_cond));
        %�����������
        num_dec_value(num_cond_value)=1;
        decision_value(num_cond_value,1)=decision_table(i,num_attr);
        dec_value_object_num(num_cond_value,1)=1;%ȡֵ��������1
    end
end
cond_value(num_cond_value+1:num_object,:)=[];
decision_value(num_cond_value+1:num_object,:)=[];
dec_value_object_num(num_cond_value+1:num_object,:)=[];
for i=1:num_cond_value
    for j=1:size(decision_value,2)
        for k=1:size(value,2)
            if decision_value(i,j)==value(k);
                temp=decision_value(i,j);  
                decision_value(i,j)=decision_value(i,k);
                decision_value(i,k)=temp;
                    
                temp=dec_value_object_num(i,j);
                dec_value_object_num(i,j)=dec_value_object_num(i,k);
                dec_value_object_num(i,k)=temp;
            end
        end
    end
end
%disp(decision_value);
% disp(dec_value_object_num);%�ֲ�����Լ�����ֱ�־
distinct_value_matrix=dec_value_object_num;
decision_table=[cond_value,zeros(size(cond_value,1),1)];
end