function [ reduction ] = Main( decision_table )
%MAIN ���ڿɱ�ʶ������㷨ʵ��
%   1. ��д���ֱ�׼,GetDistinctionThoughCriterion(decision_table)����,����distinct_matrix;
%   2. ����distinct_matrix���пɱ�ʶ���������,GetMatrix(distinct_matrix);
%   3. �Կɱ�ʶ�����Լ��,ɾ������Ҫ���Ӽ�������ϵ,GetReducedMatrix(matrix);
%   4. ��Լ���ľ�����й�����ȡ,Ȼ�����reduction��,GetReduction()
% decision_table=GetReducedDecisionTable(decision_table);%���������Ծ�������ֵͬʱһ���Ķ������ɾ��
[decision_table,distinct_value_matrix]=GetDistinctionThroughCriterion(decision_table);%��ȡ������Ϣ
distinct_matrix=GetMatrix(decision_table,distinct_value_matrix);%����distinct_matrix���пɱ�ʶ���������
distinct_matrix=GetReducedMatrix(distinct_matrix);%�Կɱ�ʶ�����Լ��,ɾ������Ҫ���Ӽ�������ϵ
num_attr=size(decision_table,2);%��ȡ������Ŀ
reduction=GetReduction(distinct_matrix,num_attr-1);%��Լ���ľ�����й�����ȡ,Ȼ�����reduction��
end

