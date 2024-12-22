package domains.article;

import domains.article.entity.Article;
import domains.article.entity.Tag;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by jay.zhou on 2018/3/7.
 */
public interface ArticleService {
    /**
     * 插入一篇新的阅读
     *
     * @param article 阅读对象
     * @return 是否操作成功，1表示成功，0表示失败
     */
    int insertArticle(Article article);

    /**
     * 插入一篇新的阅读
     * 为什么写这个方法，那是因为添加阅读的标签。
     * 原因是，必须先插入阅读到数据库中，然后阅读的实体类才有ID
     * 根据这个阅读的ID插入标签
     *
     * @param article 阅读对象
     * @param request 封装着前台tag的request对象，说实话，很头疼，Service方法上有request对象
     * @return 是否操作成功，1表示成功，0表示失败
     */
    int insertArticle(Article article, HttpServletRequest request);

    /**
     * 删除一篇阅读
     *
     * @param article 阅读对象，操作此阅读对象之前先要查询到此阅读对象
     * @return 是否操作成功，1表示成功，0表示失败
     */
    int deleteArticle(Article article);

    /**
     * 更新阅读,只允许更新内容
     *
     * @param article 阅读实体对象，需要先查询到此对象
     * @return 是否操作成功，1表示成功，0表示失败
     */
    int updateArticle(Article article);

    /**
     * 通过id获取到此阅读，方便对其进行CRUD操作
     *
     * @param id 阅读主键id
     * @return 查询到的Article实体对象，如果没有，返回空参对象
     */
    Article getArticleById(Long id);


    /**
     * 获取所有阅读
     *
     * @param map 如果map没有参数，返回所有阅读给管理员。如果有参数，可能返回的是指定作者的阅读
     * @return 所有阅读的List集合
     */
    List<Article> getAllArticle(Map<String, Object> map);

    /**
     * 获取指定条数的阅读，按照点击量降序排行
     *
     * @param limit 指定条数
     * @return 将阅读放到List集合中
     */
    List<Article> getArticleByClick(Integer limit);

    /**
     * 按照指定的情况获取阅读
     * SQL语句可以用<if test>进行扩展</>
     * 根据SQL语句 select * from t_article where author = #{author} order by #{condition} #{sort}
     * 在mybatis中，order by 后面的参数使用 ${}接收。
     * 公司里面的模糊查询: like '%${subordinateName}%'
     * see:https://blog.csdn.net/yanluandai1985/article/details/79708339
     * 参数有
     * author  作者名字
     * condition 根据什么排序
     * sort 取值为 "DESC" 或者 "ASC'
     *
     * @param map 封装着情况的map集合，拥有情况，作者名
     * @return 将阅读放到List集合中
     */
    List<Article> getArticleByCondition(Map<String, Object> map);

    /**
     * 获取前一篇阅读
     *
     * @param currentArticleId 当前阅读的ID号
     * @return 上一篇阅读的实体类
     */
    Article getPreviousArticle(Long currentArticleId);

    /**
     * 获取下一篇阅读
     *
     * @param currentArticleId 当前阅读的ID号
     * @return 下篇阅读的实体类
     */
    Article getNextArticle(Long currentArticleId);

    /**
     * 为这篇阅读插入标签
     * 不想再弄一个标签的Service了，麻烦
     *
     * @param tags 多个标签实体的List集合，这个SQL语句还是挺有用的
     * @return 是否插入成功
     */
    int insertArticleTag(List<Tag> tags);

    /**
     * 根据阅读的id获取阅读的所有标签
     *
     * @param articleId 阅读的id
     * @return 这篇阅读的所有标签
     */
    List<Tag> getTagsByArticleId(Long articleId);

    /**
     * 根据标签名的map集合，获取相似的标签对象。
     * 然后根据这些标签对象的ArticleId
     * 获取到这些阅读对象
     * 封装到List集合中，使用map对象传到前端页面
     *
     * @param tagNames 封装着多个标签名的map集合
     * @return 与map集合中的标签名相似的标签集合
     */
    List<Tag> getSimilarTag(Map<String, Object> tagNames);

    /**
     * 获取上推荐的阅读的主键ID
     * 暂时条件定为：评论最多的几篇阅读
     *
     * @return 推荐的阅读的主键ID，然后批量查询这些阅读
     */
    List<Long> getRecommandArticleId();

    /**
     * 根据上推荐的阅读的ID，获取这些阅读
     *
     * @param articleIds 指定阅读的id的集合
     * @return 这些id对应的阅读
     */
    List<Article> getRecommandArtice(List<Long> articleIds);

    /**
     * 删除指定id的阅读的标签
     *
     * @param articleId 阅读的标签
     * @return 是否操作成功，0代表失败，1代表成功
     */
    int deleteTagByArticleId(Long articleId);
}
