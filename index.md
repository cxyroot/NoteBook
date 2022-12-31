## 对大表添加索引（五百万以上的数据）

```mysql
-- 创建临时表表
CREATE TABLE t_teaching_plan_individual_goal_bak LIKE t_teaching_plan_individual_goal;

-- 创建索引
CREATE INDEX iep_step_id_index ON t_teaching_plan_individual_goal_bak (iep_step_id);

-- 拷贝数据
INSERT INTO t_teaching_plan_individual_goal_bak
SELECT * FROM t_teaching_plan_individual_goal;

-- 修改名称
RENAME TABLE t_teaching_plan_individual_goal_b TO t_teaching_plan_individual_goal;
RENAME TABLE t_teaching_plan_individual_goal TO t_teaching_plan_individual_goal_bak;
```

## 两个系统进行交互



```java
@Configuration
public class FeignConfig implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate requestTemplate) {
        //将本次请求头中的jwt取出，在调用其他微服务的接口时，将jwt放入请求中
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String jwt = TokenUtil.getTokenFromHeader(request);
        if (StringUtils.isNotEmpty(jwt)) {
            requestTemplate.header("Authorization", "Bearer " + jwt);
        }else{
            jwt = TokenUtil.getTokenFromCookie(request);
            requestTemplate.header("Authorization", "Bearer " + jwt);
        }
    }
}
```

```java
import com.wucailu.ims.common.vo.ApiResult;
import com.wucailu.ims.crm.feign.FeignConfig;
import com.wucailu.ims.crm.modules.customers.vo.CustomerToTeachingSystem;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(contextId ="customerSupplyId",name = "jiaoxuexitong", fallback = CustomerSupplyFeignFallback.class, configuration = FeignConfig.class)
public interface CustomerSupplyFeign {

    @PostMapping(value = "/a/api/at-school-student/save-customer-supply",consumes = "application/json")
    ApiResult saveCustomerSupply(@RequestBody CustomerToTeachingSystem customerToTeachingSystem);

}
```

```java
import com.wucailu.ims.common.vo.ApiResult;
import com.wucailu.ims.crm.modules.customers.vo.CustomerToTeachingSystem;

public class CustomerSupplyFeignFallback implements CustomerSupplyFeign {
    
    @Override
    public ApiResult saveCustomerSupply(CustomerToTeachingSystem customerToTeachingSystem) {
        return ApiResult.createErrorResult("网络异常");
    }

}
```

