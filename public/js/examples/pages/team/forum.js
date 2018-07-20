/**
 * Admui-basic v1.1.0 (http://www.admui.com/)
 * Copyright 2015-2017 Admui Team
 * Licensed under the Admui License 1.0 (http://www.admui.com/about/#license)
 */
(function ($) {
    'use strict';

    App.extend({
        run: function (next) {
            $('.markdown-edit').markdown({
                language: 'zh',
                iconlibrary: 'fa'
            });

            next();
        }
    });

    $(function () {
       App.run();
    });
    
})(jQuery);
