package com.just.utils;

import com.fasterxml.jackson.annotation.JsonView;
import org.apache.ibatis.javassist.ClassPool;
import org.apache.ibatis.javassist.CtClass;
import org.apache.ibatis.javassist.CtField;
import org.apache.ibatis.javassist.NotFoundException;
import org.apache.ibatis.javassist.bytecode.AnnotationsAttribute;
import org.apache.ibatis.javassist.bytecode.ConstPool;
import org.apache.ibatis.javassist.bytecode.FieldInfo;
import org.apache.ibatis.javassist.bytecode.annotation.Annotation;
import org.apache.ibatis.javassist.bytecode.annotation.ClassMemberValue;
import org.apache.ibatis.javassist.bytecode.annotation.MemberValue;
import org.apache.ibatis.javassist.bytecode.annotation.StringMemberValue;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * 参考文章
 * https://blog.csdn.net/hundan_520520/article/details/103860135
 * https://blog.csdn.net/Adda_Chen/article/details/120869545
 */
public class AnnotationUtil {

    /**
     通过反射，修改字段上面的 注解值（前提：这个字段上面要有 @JsonView 这个注解，否则会报错）
     因为 @JsonView 的值是支持数组，所以这些事 累加添加视图。
     **/
    public static void modifyAnnoByReflex_field(Field field, Class clazz) {
        try {
            // 1. 获取 属性上面的注解
            JsonView jsonView = field.getAnnotation(JsonView.class);
            // 2. 获取 jsonView 这个代理实例所持有的 InvocationHandler
            InvocationHandler h = Proxy.getInvocationHandler(jsonView);
            // 3. 获取 AnnotationInvocationHandler 的 memberValues 字段
            Field hField = h.getClass().getDeclaredField("memberValues");
            // 4. 因为这个字段事 private final 修饰，所以要打开权限
            hField.setAccessible(true);
            // 5. 获取 memberValues
            Map memberValues = (Map) hField.get(h);
            // 6. 先获取原先注解的属性值
            Class[] classes = jsonView.value();
            if (classes != null && classes.length > 0) {
                Set<Class> classSet = new HashSet<>();
                for (int i = 0; i < classes.length; i++) {
                    classSet.add(classes[i]);
                }
                // 加入传入的 class
                classSet.add(clazz);
                // 将 set 转换为 class[]
                Class[] clazzes = classSet.toArray(new Class[classSet.size()]);
                // 修改 value 属性值
                memberValues.put("value", clazzes);
            } else {
                Class[] clazzes = {clazz};
                // 修改 value 属性值
                memberValues.put("value", clazzes);
            }
        } catch (Exception e) {
            System.out.println("当前字段名=" + field.getName());
            e.printStackTrace();
        }
    }

    /**
     * 功能：动态的给类属性添加注解
     *  用于本来没有注解，直接添加上一行整注解
     * （可以持久化到内存，可作为工具类使用）
     * @param className     类名
     * @param attributeName 类属性
     * @param typeName      注解类型
     */
    public static void addAnnotation(String className, String attributeName, String typeName) {
        try {
            ClassPool pool = ClassPool.getDefault();
            CtClass ct = pool.get(className);
            CtField cf = ct.getField(attributeName);
            FieldInfo fieldInfo = cf.getFieldInfo();
            AnnotationsAttribute attribute = (AnnotationsAttribute) fieldInfo.getAttribute(AnnotationsAttribute.visibleTag);
            ConstPool cp = fieldInfo.getConstPool();
            Annotation annotation = new Annotation(typeName, cp);
            System.out.println("添加注解" + annotation);
            attribute.addAnnotation(annotation);
            System.out.println("添加后的所有注解" + Arrays.toString(attribute.getAnnotations()));
        } catch (NotFoundException e) {
            System.out.println("此类不存在" + e);
        }
    }

    /**
     * 遍历注解所有属性
     *
     * @param className     类名
     * @param attributeName 类属性
     */
    public static void queryAnnotation(String className, String attributeName) {
        System.out.println("====开始遍历注解所有属性=====");
        System.out.println("");
        try {
            ClassPool pool = ClassPool.getDefault();
            //获取实体类
            CtClass ct = pool.get(className);
            //获取属性
            CtField cf = ct.getField(attributeName);
            //获取属性字段信息
            FieldInfo fieldInfo = cf.getFieldInfo();
            //获取属性字段的运行时可见注释
            AnnotationsAttribute attribute = (AnnotationsAttribute) fieldInfo.getAttribute(AnnotationsAttribute.visibleTag);
            //获取所有注解
            Annotation[] annotations = attribute.getAnnotations();
            int sum = 0;
            //遍历注解
            for (Annotation annotation : annotations) {
                sum++;
                System.out.println("注解" + sum + "：" + annotation.toString());
                //如果没有属性名，就下一个循环
                if (annotation.getMemberNames() == null) {
                    System.out.println("！无属性名跟属性值！");
                    continue;
                }
                //获取注解的所有属性名，跟属性值
                for (String memberName : annotation.getMemberNames()) {
                    MemberValue memberValue = annotation.getMemberValue(memberName);
                    System.out.println("获取到的注解的属性名：" + memberName);
                    System.out.println("获取到的注解的属性值：" + memberValue);
                }
            }
        } catch (NotFoundException e) {
            System.out.println("此类不存在" + e);
        }
    }

    /**
     * 获取指定字段的指定注解
     *
     * @param className     类名
     * @param attributeName 类属性
     * @param annotionName  指定注解名
     */
    public static Annotation getAnnotation(String className, String attributeName, String annotionName) {
        Annotation tableField = null;
        try {
            ClassPool pool = ClassPool.getDefault();
            //获取实体类
            CtClass ct = pool.get(className);
            //获取属性
            CtField cf = ct.getField(attributeName);
            //获取属性字段信息
            FieldInfo fieldInfo = cf.getFieldInfo();
            //获取该字段的常量池
            ConstPool constPool = cf.getFieldInfo().getConstPool();
            //获取属性字段的运行时可见注释
            AnnotationsAttribute attribute = (AnnotationsAttribute) fieldInfo.getAttribute(AnnotationsAttribute.visibleTag);
            //获取该字段所有注解
            Annotation[] annotations = attribute.getAnnotations();
            for (Annotation annotation : annotations) {
                //注解名包含字段，就命中返回
                if (annotation.toString().contains(annotionName)) {
                    tableField = annotation;
                    return tableField;
                }
            }
        } catch (NotFoundException e) {
            System.out.println("捕获异常" + e.getMessage());
        }
        return tableField;
    }

    /**
     * 根据给定的注解体，给其添加属性
     *  （不能持久化到内存，只能作为代码一部分使用）
     * @param className     类名
     * @param attributeName 类属性
     * @param annotation    注解实体
     * @param key           给注解添加的属性
     * @param value         给注解添加的属性的值
     * @return
     */
    public static Annotation editAnnotationBy(String className, String attributeName, Annotation annotation, String key, String value) {
        try {
            ClassPool pool = ClassPool.getDefault();
            //获取实体类
            CtClass ct = pool.get(className);
            //获取属性
            CtField cf = ct.getField(attributeName);
            //获取该字段的常量池
            ConstPool constPool = cf.getFieldInfo().getConstPool();
            //给指定的注解添加属性
            annotation.addMemberValue(key, new StringMemberValue(value, constPool));
            return annotation;
        } catch (Exception e) {
            System.out.println("捕获异常" + e.getMessage());
        }
        return annotation;
    }

    /**
     * 功能：使用生成的注解体 ；动态的给类注解添加属性
     * （可以持久化到内存，可作为工具类使用）
     * @param className     类名
     * @param attributeName 类属性
     */
    public static void addAnnotationBy(String className, String attributeName, Annotation annotation) {
        try {
            ClassPool pool = ClassPool.getDefault();
            CtClass ct = pool.get(className);
            CtField cf = ct.getField(attributeName);
            FieldInfo fieldInfo = cf.getFieldInfo();
            AnnotationsAttribute attribute = (AnnotationsAttribute) fieldInfo.getAttribute(AnnotationsAttribute.visibleTag);
            attribute.addAnnotation(annotation);
            System.out.println("添加后的所有注解" + Arrays.toString(attribute.getAnnotations()));
        } catch (NotFoundException e) {
            System.out.println("此类不存在" + e);
        }
    }
}

