function [ distinct_matrix ] = GetReducedMatrix( distinct_matrix )
%GETREDUCEDMATRIX �Կɱ�ʶ�������Լ��ɾ���Ӽ�������ϵ
num_object=size(distinct_matrix,1);
for i=1:num_object
    for j=i+1:num_object
        %�����ǰΪ��
        if all(distinct_matrix{i,j}==0),continue;end
        for x=i:num_object
            for y=x+1:num_object
                if(x==i)&&(y<=j),continue;end
                if ~all(distinct_matrix{i,j}==0)
                    [distinct_matrix{i,j},distinct_matrix{x,y}]=DeleteInclusion(distinct_matrix{i,j},distinct_matrix{x,y});
                end
            end
        end
    end
end
end
