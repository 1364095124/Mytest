<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/12
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/mycss/ant.css">
<style type="text/css">

    a{
        text-decoration:none !important;
    }
</style>
<body>
    <%--<div class="layui-row" style="background: #ffffff;height:85px;">
        <div class="layui-col-md4" style="text-align: center;padding:10px;">
            <span class="mytitle" >全部提醒</span>
            <p class="mycontent" ><span>8</span>个提醒</p>
            <em></em>
        </div>
        <div class="layui-col-md4" style="text-align: center;padding:10px;">
            <span class="mytitle" >过期提醒</span>
            <p class="mycontent" ><span>8</span>个提醒</p>
            <em></em>
        </div>
        <div class="layui-col-md4" style="text-align: center;padding:10px;">
            <span class="mytitle">代提醒</span>
            <p class="mycontent" ><span>8</span>个提醒</p>
            <em></em>
        </div>
    </div>--%>

    <div class="antd-pro-components-page-header-wrapper-grid-content-main">
        <div class="antd-pro-pages-list-basic-list-standardList">
            <div class="ant-card ant-card-wider-padding ant-card-padding-transition">
                <div class="ant-card-body">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4">
                            <div class="antd-pro-pages-list-basic-list-headerInfo"><span>我的待办</span>
                                <p>8个任务</p><em></em></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm4">
                            <div class="antd-pro-pages-list-basic-list-headerInfo"><span>本周任务平均处理时间</span>
                                <p>32分钟</p><em></em></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm4">
                            <div class="antd-pro-pages-list-basic-list-headerInfo"><span>本周完成任务数</span>
                                <p>24个任务</p></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ant-card antd-pro-pages-list-basic-list-listCard ant-card-wider-padding ant-card-padding-transition"
                 style="margin-top: 24px;">
                <div class="ant-card-head">
                    <div class="ant-card-head-wrapper">
                        <div class="ant-card-head-title" >标准列表</div>
                        <div class="ant-card-extra" style="height:35px !important;">
                            <div>
                                <div class="ant-radio-group ant-radio-group-outline"><label
                                        class="ant-radio-button-wrapper ant-radio-button-wrapper-checked"><span
                                        class="ant-radio-button ant-radio-button-checked"><input type="radio"
                                                                                                 class="ant-radio-button-input"
                                                                                                 value="all" checked=""><span
                                        class="ant-radio-button-inner"></span></span><span>全部</span></label><label
                                        class="ant-radio-button-wrapper"><span class="ant-radio-button"><input
                                        type="radio" class="ant-radio-button-input" value="progress"><span
                                        class="ant-radio-button-inner"></span></span><span>进行中</span></label><label
                                        class="ant-radio-button-wrapper"><span class="ant-radio-button"><input
                                        type="radio" class="ant-radio-button-input" value="waiting"><span
                                        class="ant-radio-button-inner"></span></span><span>等待中</span></label></div>
                                <span class="ant-input-search antd-pro-pages-list-basic-list-extraContentSearch ant-input-affix-wrapper"><input
                                        placeholder="请输入" class="ant-input" type="text" value=""><span
                                        class="ant-input-suffix"><i aria-label="图标: search" tabindex="-1"
                                                                    class="anticon anticon-search ant-input-search-icon"><svg
                                        viewBox="64 64 896 896" class="" data-icon="search" width="1em" height="1em"
                                        fill="currentColor" aria-hidden="true"><path
                                        d="M909.6 854.5L649.9 594.8C690.2 542.7 712 479 712 412c0-80.2-31.3-155.4-87.9-212.1-56.6-56.7-132-87.9-212.1-87.9s-155.5 31.3-212.1 87.9C143.2 256.5 112 331.8 112 412c0 80.1 31.3 155.5 87.9 212.1C256.5 680.8 331.8 712 412 712c67 0 130.6-21.8 182.7-62l259.7 259.6a8.2 8.2 0 0 0 11.6 0l43.6-43.5a8.2 8.2 0 0 0 0-11.6zM570.4 570.4C528 612.7 471.8 636 412 636s-116-23.3-158.4-65.6C211.3 528 188 471.8 188 412s23.3-116.1 65.6-158.4C296 211.3 352.2 188 412 188s116.1 23.2 158.4 65.6S636 352.2 636 412s-23.3 116.1-65.6 158.4z"></path></svg></i></span></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-card-body" style="padding: 0px 32px 40px;">
                    <button type="button" onclick="openModak()" class="ant-btn ant-btn-dashed" style="width: 100%; margin-bottom: 8px;"
                            ant-click-animating-without-extra-node="false"><i aria-label="图标: plus"
                                                                              class="anticon anticon-plus">
                        <svg viewBox="64 64 896 896" class="" data-icon="plus" width="1em" height="1em"
                             fill="currentColor" aria-hidden="true">
                            <path d="M848 474H550V152h-76v322H176c-4.4 0-8 3.6-8 8v60c0 4.4 3.6 8 8
                            8h298v322h76V550h298c4.4 0 8-3.6 8-8v-60c0-4.4-3.6-8-8-8z"></path>
                        </svg>
                    </i><span>添加</span></button>
                    <div class="ant-list ant-list-lg ant-list-split ant-list-something-after-last-item">
                        <div class="ant-spin-nested-loading">
                            <div class="ant-spin-container">
                                <div class="ant-list-item">
                                    <div class="ant-list-item-meta">
                                        <div class="ant-list-item-meta-avatar"><span
                                                class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img
                                                src="https://gw.alipayobjects.com/zos/rmsportal/WdGqmHpayyMjiEhcKoVE.png"></span>
                                        </div>
                                        <div class="ant-list-item-meta-content"><h4 class="ant-list-item-meta-title"><a
                                                href="https://ant.design">Alipay</a></h4>
                                            <div class="ant-list-item-meta-description">那是一种内在的东西， 他们到达不了，也无法触及的</div>
                                        </div>
                                    </div>
                                    <div class="ant-list-item-content">
                                        <div class="antd-pro-pages-list-basic-list-listContent">
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>Owner</span>
                                                <p>付小小</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>开始时间</span>
                                                <p>2019-03-13 10:36</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <div class="ant-progress ant-progress-line ant-progress-status-active ant-progress-show-info ant-progress-default"
                                                     style="width: 180px;">
                                                    <div>
                                                        <div class="ant-progress-outer">
                                                            <div class="ant-progress-inner">
                                                                <div class="ant-progress-bg"
                                                                     style="width: 54%; height: 6px; border-radius: 100px;"></div>
                                                            </div>
                                                        </div>
                                                        <span class="ant-progress-text" title="54%">54%</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="ant-list-item-action">
                                        <li><a>编辑</a><em class="ant-list-item-action-split"></em></li>
                                        <li><a class="ant-dropdown-trigger">更多 <i aria-label="图标: down"
                                                                                  class="anticon anticon-down">
                                            <svg viewBox="64 64 896 896" class="" data-icon="down" width="1em"
                                                 height="1em" fill="currentColor" aria-hidden="true">
                                                <path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z"></path>
                                            </svg>
                                        </i></a></li>
                                    </ul>
                                </div>
                                <div class="ant-list-item">
                                    <div class="ant-list-item-meta">
                                        <div class="ant-list-item-meta-avatar"><span
                                                class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img
                                                src="https://gw.alipayobjects.com/zos/rmsportal/zOsKZmFRdUtvpqCImOVY.png"></span>
                                        </div>
                                        <div class="ant-list-item-meta-content"><h4 class="ant-list-item-meta-title"><a
                                                href="https://ant.design">Angular</a></h4>
                                            <div class="ant-list-item-meta-description">希望是一个好东西，也许是最好的，好东西是不会消亡的</div>
                                        </div>
                                    </div>
                                    <div class="ant-list-item-content">
                                        <div class="antd-pro-pages-list-basic-list-listContent">
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>Owner</span>
                                                <p>曲丽丽</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>开始时间</span>
                                                <p>2019-03-13 08:36</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <div class="ant-progress ant-progress-line ant-progress-status-exception ant-progress-show-info ant-progress-default"
                                                     style="width: 180px;">
                                                    <div>
                                                        <div class="ant-progress-outer">
                                                            <div class="ant-progress-inner">
                                                                <div class="ant-progress-bg"
                                                                     style="width: 84%; height: 6px; border-radius: 100px;"></div>
                                                            </div>
                                                        </div>
                                                        <span class="ant-progress-text"><i aria-label="图标: close-circle"
                                                                                           class="anticon anticon-close-circle"><svg
                                                                viewBox="64 64 896 896" class=""
                                                                data-icon="close-circle" width="1em" height="1em"
                                                                fill="currentColor" aria-hidden="true"><path
                                                                d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm165.4 618.2l-66-.3L512 563.4l-99.3 118.4-66.1.3c-4.4 0-8-3.5-8-8 0-1.9.7-3.7 1.9-5.2l130.1-155L340.5 359a8.32 8.32 0 0 1-1.9-5.2c0-4.4 3.6-8 8-8l66.1.3L512 464.6l99.3-118.4 66-.3c4.4 0 8 3.5 8 8 0 1.9-.7 3.7-1.9 5.2L553.5 514l130 155c1.2 1.5 1.9 3.3 1.9 5.2 0 4.4-3.6 8-8 8z"></path></svg></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="ant-list-item-action">
                                        <li><a>编辑</a><em class="ant-list-item-action-split"></em></li>
                                        <li><a class="ant-dropdown-trigger">更多 <i aria-label="图标: down"
                                                                                  class="anticon anticon-down">
                                            <svg viewBox="64 64 896 896" class="" data-icon="down" width="1em"
                                                 height="1em" fill="currentColor" aria-hidden="true">
                                                <path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z"></path>
                                            </svg>
                                        </i></a></li>
                                    </ul>
                                </div>
                                <div class="ant-list-item">
                                    <div class="ant-list-item-meta">
                                        <div class="ant-list-item-meta-avatar"><span
                                                class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img
                                                src="https://gw.alipayobjects.com/zos/rmsportal/dURIMkkrRFpPgTuzkwnB.png"></span>
                                        </div>
                                        <div class="ant-list-item-meta-content"><h4 class="ant-list-item-meta-title"><a
                                                href="https://ant.design">Ant Design</a></h4>
                                            <div class="ant-list-item-meta-description">生命就像一盒巧克力，结果往往出人意料</div>
                                        </div>
                                    </div>
                                    <div class="ant-list-item-content">
                                        <div class="antd-pro-pages-list-basic-list-listContent">
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>Owner</span>
                                                <p>林东东</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>开始时间</span>
                                                <p>2019-03-13 06:36</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <div class="ant-progress ant-progress-line ant-progress-status-normal ant-progress-show-info ant-progress-default"
                                                     style="width: 180px;">
                                                    <div>
                                                        <div class="ant-progress-outer">
                                                            <div class="ant-progress-inner">
                                                                <div class="ant-progress-bg"
                                                                     style="width: 99%; height: 6px; border-radius: 100px;"></div>
                                                            </div>
                                                        </div>
                                                        <span class="ant-progress-text" title="99%">99%</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="ant-list-item-action">
                                        <li><a>编辑</a><em class="ant-list-item-action-split"></em></li>
                                        <li><a class="ant-dropdown-trigger">更多 <i aria-label="图标: down"
                                                                                  class="anticon anticon-down">
                                            <svg viewBox="64 64 896 896" class="" data-icon="down" width="1em"
                                                 height="1em" fill="currentColor" aria-hidden="true">
                                                <path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z"></path>
                                            </svg>
                                        </i></a></li>
                                    </ul>
                                </div>
                                <div class="ant-list-item">
                                    <div class="ant-list-item-meta">
                                        <div class="ant-list-item-meta-avatar"><span
                                                class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img
                                                src="https://gw.alipayobjects.com/zos/rmsportal/sfjbOqnsXXJgNCjCzDBL.png"></span>
                                        </div>
                                        <div class="ant-list-item-meta-content"><h4 class="ant-list-item-meta-title"><a
                                                href="https://ant.design">Ant Design Pro</a></h4>
                                            <div class="ant-list-item-meta-description">城镇中有那么多的酒馆，她却偏偏走进了我的酒馆</div>
                                        </div>
                                    </div>
                                    <div class="ant-list-item-content">
                                        <div class="antd-pro-pages-list-basic-list-listContent">
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>Owner</span>
                                                <p>周星星</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>开始时间</span>
                                                <p>2019-03-13 04:36</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <div class="ant-progress ant-progress-line ant-progress-status-active ant-progress-show-info ant-progress-default"
                                                     style="width: 180px;">
                                                    <div>
                                                        <div class="ant-progress-outer">
                                                            <div class="ant-progress-inner">
                                                                <div class="ant-progress-bg"
                                                                     style="width: 83%; height: 6px; border-radius: 100px;"></div>
                                                            </div>
                                                        </div>
                                                        <span class="ant-progress-text" title="83%">83%</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="ant-list-item-action">
                                        <li><a>编辑</a><em class="ant-list-item-action-split"></em></li>
                                        <li><a class="ant-dropdown-trigger">更多 <i aria-label="图标: down"
                                                                                  class="anticon anticon-down">
                                            <svg viewBox="64 64 896 896" class="" data-icon="down" width="1em"
                                                 height="1em" fill="currentColor" aria-hidden="true">
                                                <path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z"></path>
                                            </svg>
                                        </i></a></li>
                                    </ul>
                                </div>
                                <div class="ant-list-item">
                                    <div class="ant-list-item-meta">
                                        <div class="ant-list-item-meta-avatar"><span
                                                class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img
                                                src="https://gw.alipayobjects.com/zos/rmsportal/siCrBXXhmvTQGWPNLBow.png"></span>
                                        </div>
                                        <div class="ant-list-item-meta-content"><h4 class="ant-list-item-meta-title"><a
                                                href="https://ant.design">Bootstrap</a></h4>
                                            <div class="ant-list-item-meta-description">那时候我只会想自己想要什么，从不想自己拥有什么</div>
                                        </div>
                                    </div>
                                    <div class="ant-list-item-content">
                                        <div class="antd-pro-pages-list-basic-list-listContent">
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>Owner</span>
                                                <p>吴加好</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <span>开始时间</span>
                                                <p>2019-03-13 02:36</p></div>
                                            <div class="antd-pro-pages-list-basic-list-listContentItem">
                                                <div class="ant-progress ant-progress-line ant-progress-status-exception ant-progress-show-info ant-progress-default"
                                                     style="width: 180px;">
                                                    <div>
                                                        <div class="ant-progress-outer">
                                                            <div class="ant-progress-inner">
                                                                <div class="ant-progress-bg"
                                                                     style="width: 53%; height: 6px; border-radius: 100px;"></div>
                                                            </div>
                                                        </div>
                                                        <span class="ant-progress-text"><i aria-label="图标: close-circle"
                                                                                           class="anticon anticon-close-circle"><svg
                                                                viewBox="64 64 896 896" class=""
                                                                data-icon="close-circle" width="1em" height="1em"
                                                                fill="currentColor" aria-hidden="true"><path
                                                                d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm165.4 618.2l-66-.3L512 563.4l-99.3 118.4-66.1.3c-4.4 0-8-3.5-8-8 0-1.9.7-3.7 1.9-5.2l130.1-155L340.5 359a8.32 8.32 0 0 1-1.9-5.2c0-4.4 3.6-8 8-8l66.1.3L512 464.6l99.3-118.4 66-.3c4.4 0 8 3.5 8 8 0 1.9-.7 3.7-1.9 5.2L553.5 514l130 155c1.2 1.5 1.9 3.3 1.9 5.2 0 4.4-3.6 8-8 8z"></path></svg></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="ant-list-item-action">
                                        <li><a>编辑</a><em class="ant-list-item-action-split"></em></li>
                                        <li><a class="ant-dropdown-trigger">更多 <i aria-label="图标: down"
                                                                                  class="anticon anticon-down">
                                            <svg viewBox="64 64 896 896" class="" data-icon="down" width="1em"
                                                 height="1em" fill="currentColor" aria-hidden="true">
                                                <path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z"></path>
                                            </svg>
                                        </i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="ant-list-pagination">
                            <div id="demo5"></div>
                        </div>
                    </div>
                    <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe>
                </div>
            </div>
        </div>
    </div>

    <form class="layui-form" action="" >
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block" style="width: 500px;">
                <input type="text" name="title" id="title" lay-verify="required" placeholder="请输入标题"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">提醒时间</label>
            <div class="layui-input-block" style="width: 500px;">
                <input type="text" name="tigger_Time" id="tigger_Time" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">具体事项</label>
            <div class="layui-input-block" style="width:800px;">
                <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        <br/>
        <br/>
    </form>



<script>

    function openModak(){

        layui.use(['layer'],function () {
            var layer = layui.layer,$=layui.$;
            layer.open({
                type:1,//类型
                offset: 'auto',
                area:['1000px','700px'],//定义宽和高
                title:'查看详细信息',//题目
                shadeClose:false,//点击遮罩层关闭
                content: temp//打开的内容
            });
        })
    }
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;
        //开启HASH

        laypage.render({
            elem: 'demo5'
            ,theme:'#1890ff'
            , count: 500
            , curr: location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
            , hash: 'fenye' //自定义hash值
        });
    });
</script>
</body>
