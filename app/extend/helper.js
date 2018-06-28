'use strict';

const getLocation = async ctx => {
  const locations = await ctx.model.Location.findAll();
  const locationId = Number(ctx.query.location) || Number(ctx.cookies.get('location'));

  if (locationId) {
    const location = locations.find(({ id }) => id === locationId);

    if (location && location.name) {
      ctx.query.location && ctx.cookies.set('location', locationId);

      return {
        locations,
        location,
      };
    }
  }

  ctx.cookies.set('location', 290);

  return {
    locations,
    location: {
      id: 290,
      name: '北京',
    },
  };
};

module.exports = {
  getLocation,
};
