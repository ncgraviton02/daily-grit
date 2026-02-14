import { defineCollection, z } from 'astro:content';

const digests = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.date(),
    artwork: z.object({
      image: z.string(),       // path to daily abstract art
      poem: z.string(),        // 5-line poem
    }).optional(),
    grit: z.object({
      name: z.string(),        // person's name
      tagline: z.string(),     // short tagline
      portrait: z.string(),    // path to line art portrait
      story: z.string(),       // 3-4 paragraph story
    }).optional(),
    headlines: z.array(z.object({
      title: z.string(),
      source: z.string(),
      url: z.string(),
      summary: z.string(),
      author: z.string().optional()
    })).optional(),
    deepReads: z.array(z.object({
      title: z.string(),
      source: z.string(),
      url: z.string(),
      summary: z.string()
    })).optional(),
    launches: z.array(z.object({
      name: z.string(),
      tagline: z.string(),
      url: z.string(),
      upvotes: z.number()
    })).optional(),
    watchLater: z.array(z.object({
      title: z.string(),
      channel: z.string(),
      url: z.string(),
      summary: z.string()
    })).optional(),
    sections: z.array(z.object({
      icon: z.string(),
      name: z.string(),
      image: z.string().optional(), // path to section hero image
      posts: z.array(z.object({
        title: z.string(),
        score: z.number(),
        comments: z.number(),
        summary: z.string(),
        permalink: z.string().optional(),
        topComments: z.array(z.object({
          author: z.string(),
          score: z.number().optional(),
          text: z.string()
        })).optional()
      }))
    }))
  })
});

export const collections = {
  digests
};
