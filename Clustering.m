clear all;

x = [166, 54
195, 82
200, 72
260, 72
265, 90
335, 124
370, 94
450, 118
517, 152
552, 132]


[row, col] = size(x);
pages = x(:,1);
price = x(:,2);

scatter(pages, price);

xlabel('page');
ylabel('price');

%%xlim([0 300]);
%%ylim([0 300]);

hold on;

k=3;

centroids =zeros(k,size(x,2));

randidx = randperm(size(x,1))

centroids = x(randidx(1:k),:);

for e=1:10
    
    group1=[];
    group2=[];
    group3=[];
    
    for i=1:row
        point = x(i,:)';
        min_dist=9999;
        p=1;
        for j=1:k
            dist=(point-centroids(j,:)')'*(point-centroids(j,:)');
            if dist<min_dist
                min_dist = dist;
                p=j;
            end
        end
        
        if p==1
            group1=[group1; point'];
        elseif p==2
            group2=[group2; point'];
        else
            group3=[group3; point'];
        end
        
    end
    
    centroids(1,:)= mean(group1,1)
    centroids(2,:)= mean(group2,1);
    centroids(3,:)= mean(group3,1);
    
    
end

%%min_dist
%%p

group1
group2
group3
i

plot(group1(:,1),group1(:,2),'o')
hold on;

plot(group2(:,1),group2(:,2),'*')
hold on;

plot(group3(:,1),group3(:,2),'d')
hold off;





