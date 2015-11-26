function [Project] = PCA( EigAveMatrix )
 %PCA���̣�coeff��ʾͶӰ����score��ʾͶӰ������������latent��ʾ����ֵ������Projectѡȡ���ɷֺ����ͶӰ����
    [coeff,score,latent]=princomp(EigAveMatrix);
    SumEnergy=0;
    for j=1:length(latent)
            SumEnergy=SumEnergy+latent(j);
            if (SumEnergy/sum(latent))>=0.99
                break;
            end
    end
    
    for k=1:j
        Project(:,k)=coeff(:,k);
    end

end

