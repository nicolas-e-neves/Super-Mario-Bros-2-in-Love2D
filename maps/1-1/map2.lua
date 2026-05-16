return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 160,
  height = 14,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 17,
  nextobjectid = 80,
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
      wangsets = {
        {
          name = "Semisolid1",
          class = "",
          tile = 2,
          wangsettype = "corner",
          properties = {},
          colors = {
            {
              color = { 255, 0, 0 },
              name = "",
              class = "",
              probability = 1,
              tile = -1,
              properties = {}
            }
          },
          wangtiles = {
            {
              wangid = { 0, 0, 0, 1, 0, 0, 0, 0 },
              tileid = 1
            },
            {
              wangid = { 0, 0, 0, 1, 0, 1, 0, 0 },
              tileid = 2
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 0 },
              tileid = 3
            },
            {
              wangid = { 0, 1, 0, 1, 0, 0, 0, 0 },
              tileid = 17
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 18
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 1 },
              tileid = 19
            }
          }
        }
      },
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
          x = 16,
          y = 160,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "1"
          }
        },
        {
          id = 53,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 160,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "2"
          }
        },
        {
          id = 54,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2176,
          y = 48,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "3"
          }
        },
        {
          id = 79,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2512,
          y = 0,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = 4
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 160,
      height = 14,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 132, 132, 132, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 212, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 21, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 21, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 21, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 21, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 148, 148, 148, 148, 148, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148, 148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 160,
      height = 14,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 3, 4, 0, 0, 0, 0, 2, 3, 3, 3, 3, 3, 4, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 128, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 128, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 4, 0, 0, 129, 131, 0, 0, 129, 131, 0, 0, 2, 3, 4, 0, 0, 0, 0, 18, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 3, 3, 3, 3, 3, 36, 0, 0, 0, 0, 35, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 34, 33, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 2, 3, 3, 3, 3, 3, 4, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 35, 3, 3, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 20, 18,
        2, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 34, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 20, 18,
        18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 20, 18,
        18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 18, 19, 33, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 35, 3, 3, 3, 3, 3, 4, 0, 0, 0, 0, 0, 18, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 20, 18,
        18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 18, 19, 18, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 33, 3, 3, 4, 0, 0, 18, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 18, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 18, 19, 19, 19, 128, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 20, 18,
        18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 20, 0, 0, 0, 0, 65, 0, 0, 0, 0, 49, 0, 0, 0, 0, 65, 0, 0, 0, 0, 18, 19, 18, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 18, 19, 19, 20, 0, 0, 18, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 18, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 81, 82, 82, 82, 82, 83, 19, 19, 19, 128, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 18, 19, 19, 19, 19, 19, 20, 18,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 3, 3, 3, 4, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 19, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 20, 0, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 0, 0, 0, 0, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17
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
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 192,
          width = 848,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 160,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 144,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 864,
          y = 64,
          width = 208,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1136,
          y = 80,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1200,
          y = 80,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 192,
          width = 512,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1872,
          y = 176,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1952,
          y = 192,
          width = 608,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2544,
          y = 0,
          width = 16,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
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
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 80,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 112,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 112,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 144,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 80,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1056,
          y = 80,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1264,
          y = 80,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1280,
          y = 160,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1248,
          y = 192,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1568,
          y = 128,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 48,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 96,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1376,
          y = 144,
          width = 112,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1744,
          y = 80,
          width = 144,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1808,
          y = 16,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1952,
          y = 16,
          width = 304,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1952,
          y = 80,
          width = 592,
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
      objects = {
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 160,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "2",
            ["map"] = "1",
            ["sprite"] = "1"
          }
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2016,
          y = 160,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "1",
            ["map"] = "3",
            ["sprite"] = "2"
          }
        },
        {
          id = 52,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2176,
          y = 48,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = "2",
            ["map"] = "3",
            ["sprite"] = "2"
          }
        }
      }
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
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 496,
          y = 48,
          width = 16,
          height = 144,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2512,
          y = -16,
          width = 16,
          height = 96,
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
          id = 78,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2512,
          y = -16,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["exit"] = 1,
            ["map"] = 4
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
      objects = {
        {
          id = 44,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["variant"] = 3
          }
        }
      }
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
      objects = {
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 752,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1504,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1696,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1616,
          y = 128,
          width = 16,
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
      objects = {
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie2"
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie2"
          }
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = ""
          }
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 768,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1616,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie2"
          }
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1696,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1712,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1536,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = ""
          }
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1504,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = ""
          }
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1744,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie2"
          }
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1776,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1792,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2272,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = ""
          }
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2304,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie2"
          }
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2320,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie2"
          }
        },
        {
          id = 73,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2496,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 74,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2480,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 75,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2464,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 76,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2448,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        },
        {
          id = 77,
          name = "",
          type = "",
          shape = "rectangle",
          x = 2432,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["content"] = "veggie1"
          }
        }
      }
    }
  }
}
