function [first_attr_set,second_attr_set] = DeleteInclusion(first_attr_set,second_attr_set)
%ɾ����֮����໥������ϵ
    if all(first_attr_set==0) || all(second_attr_set==0),return ;end;
    flag=0;%����first_attr_set��second_attr_set��ȡֵ�����0������ȣ�1����first����second,2����first��second����,3����������
    num_attr=size(first_attr_set,2);
    for p=1:num_attr
        if first_attr_set(p)==second_attr_set(p),continue;end
        if flag==0%���Ϊ��ʼ��״̬
            if first_attr_set(p)>second_attr_set(p)
                flag=1;
            elseif first_attr_set(p)<second_attr_set(p)
                flag=2;
            end
        elseif ( flag==1 && first_attr_set(p)<second_attr_set(p) ) || ( flag==2 && first_attr_set(p)>second_attr_set(p) )
            flag=3;
        end
    end
    if flag==1%���Ϊfirst����second״̬
        first_attr_set=zeros(1,num_attr);
    elseif flag==0 || flag==2%���Ϊsecond����first״̬����second��first��ȵ����
        second_attr_set=zeros(1,num_attr);
    end
end
