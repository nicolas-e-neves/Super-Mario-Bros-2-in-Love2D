return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 60,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 17,
  nextobjectid = 108,
  properties = {},
  tilesets = {
    {
      name = "Tileset",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../../sprites/tiles/Tilesets1.png",
      imagewidth = 256,
      imageheight = 128,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 128,
      tiles = {}
    },
    {
      name = "Animated",
      firstgid = 129,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../../sprites/tiles/animated.png",
      imagewidth = 256,
      imageheight = 128,
      transparentcolor = "#000000",
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 128,
      tiles = {
        {
          id = 0,
          animation = {
            {
              tileid = 0,
              duration = 200
            },
            {
              tileid = 16,
              duration = 200
            },
            {
              tileid = 32,
              duration = 200
            },
            {
              tileid = 48,
              duration = 200
            },
            {
              tileid = 64,
              duration = 200
            },
            {
              tileid = 80,
              duration = 200
            },
            {
              tileid = 96,
              duration = 200
            },
            {
              tileid = 112,
              duration = 200
            }
          }
        },
        {
          id = 1,
          animation = {
            {
              tileid = 1,
              duration = 200
            },
            {
              tileid = 17,
              duration = 200
            },
            {
              tileid = 33,
              duration = 200
            },
            {
              tileid = 49,
              duration = 200
            },
            {
              tileid = 65,
              duration = 200
            },
            {
              tileid = 81,
              duration = 200
            },
            {
              tileid = 97,
              duration = 200
            },
            {
              tileid = 113,
              duration = 200
            }
          }
        },
        {
          id = 2,
          animation = {
            {
              tileid = 2,
              duration = 200
            },
            {
              tileid = 18,
              duration = 200
            },
            {
              tileid = 34,
              duration = 200
            },
            {
              tileid = 50,
              duration = 200
            },
            {
              tileid = 66,
              duration = 200
            },
            {
              tileid = 82,
              duration = 200
            },
            {
              tileid = 98,
              duration = 200
            },
            {
              tileid = 114,
              duration = 200
            }
          }
        },
        {
          id = 3,
          animation = {
            {
              tileid = 3,
              duration = 133
            },
            {
              tileid = 4,
              duration = 133
            },
            {
              tileid = 5,
              duration = 133
            },
            {
              tileid = 6,
              duration = 133
            },
            {
              tileid = 7,
              duration = 133
            },
            {
              tileid = 8,
              duration = 133
            },
            {
              tileid = 9,
              duration = 133
            },
            {
              tileid = 10,
              duration = 133
            }
          }
        },
        {
          id = 19,
          animation = {
            {
              tileid = 19,
              duration = 133
            },
            {
              tileid = 20,
              duration = 133
            },
            {
              tileid = 21,
              duration = 133
            },
            {
              tileid = 22,
              duration = 133
            },
            {
              tileid = 23,
              duration = 133
            },
            {
              tileid = 24,
              duration = 133
            },
            {
              tileid = 25,
              duration = 133
            },
            {
              tileid = 26,
              duration = 133
            }
          }
        },
        {
          id = 67,
          animation = {
            {
              tileid = 67,
              duration = 600
            },
            {
              tileid = 68,
              duration = 600
            }
          }
        },
        {
          id = 83,
          animation = {
            {
              tileid = 83,
              duration = 600
            },
            {
              tileid = 84,
              duration = 600
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
      name = "Palette",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {
        ["character"] = "light",
        ["map"] = "W1_W2_W3_main"
      },
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 11,
      name = "Spawn",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 944,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "1"
          }
        },
        {
          id = 107,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 0,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = 2
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 60,
      id = 7,
      name = "Background",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 18, 19, 19, 19, 20, 19, 19, 18, 19, 19, 20, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 60,
      id = 1,
      name = "Solid",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 129, 131, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 129, 130, 131, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 129, 130, 130, 131, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 196, 0, 196, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 212, 0, 196, 0, 0, 212, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 212, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 129, 130, 130, 130, 130, 131, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 129, 131, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 129, 130, 130, 131, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 212, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 129, 130, 130, 130, 130, 131, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 4, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 129, 130, 131, 0,
        0, 0, 0, 0, 0, 0, 0, 2, 34, 19, 20, 0, 0, 0, 0, 0,
        0, 129, 130, 131, 0, 0, 0, 18, 20, 19, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 18, 20, 19, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 2, 3, 3, 34, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 19, 20, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 19, 20, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 33, 3, 3, 3, 4, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 18, 19, 19, 19, 20, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 18, 19, 19, 19, 20, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 33, 3, 34, 19, 19, 20, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 18, 19, 20, 19, 19, 20, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 18, 19, 20, 19, 19, 20, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 35, 3, 3, 3, 3, 3, 3, 4, 0, 0,
        0, 0, 129, 130, 131, 0, 18, 19, 19, 19, 19, 19, 19, 20, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 20, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 20, 0, 0,
        0, 0, 0, 0, 0, 2, 3, 3, 3, 3, 3, 3, 3, 36, 0, 0,
        0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0,
        0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0,
        0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 33, 3, 3, 4, 0,
        0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 18, 19, 19, 20, 0,
        0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 18, 19, 19, 20, 0,
        0, 0, 5, 0, 2, 3, 3, 3, 34, 19, 19, 18, 19, 19, 20, 0,
        0, 0, 196, 0, 18, 19, 19, 19, 20, 19, 19, 18, 19, 19, 20, 0,
        0, 0, 196, 0, 18, 19, 19, 19, 20, 19, 19, 18, 19, 19, 20, 0,
        129, 131, 196, 129, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 131,
        0, 0, 196, 0, 18, 19, 19, 19, 20, 19, 19, 18, 19, 19, 20, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "SolidCollision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "SemiSolidCollision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 84,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 272,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 85,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 320,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 86,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 352,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 87,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 432,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 112,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 89,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 48,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 64,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 91,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 544,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 92,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 512,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 480,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 528,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 576,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 624,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 672,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 720,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 736,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 100,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 784,
          width = 144,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 101,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 832,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 102,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 880,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 103,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 928,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 928,
          width = 208,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "Doors",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
      name = "Climbable",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 78,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 896,
          width = 16,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 304,
          width = 16,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 80,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 80,
          width = 16,
          height = 176,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 81,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 128,
          width = 16,
          height = 144,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 64,
          width = 16,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 83,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = -16,
          width = 16,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 16,
      name = "ClimbableExit",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 105,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 960,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = 4,
            ["map"] = 2
          }
        },
        {
          id = 106,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = -16,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = 1,
            ["map"] = 5
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 13,
      name = "Mushrooms",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 15,
      name = "Cherries",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "Grass",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    }
  }
}
