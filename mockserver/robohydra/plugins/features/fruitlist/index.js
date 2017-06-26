var RoboHydraHeadStatic = require("robohydra").heads.RoboHydraHeadStatic,
    fruitlistRsponse = require("./responses/fruitlist_data");

exports.getBodyParts = function(conf) {
    return {
        heads: [
            new RoboHydraHeadStatic({
                name: 'fruit-list',
                path: '/fruitlist',
                content: fruitlistRsponse.content
            })
        ]
    };
};