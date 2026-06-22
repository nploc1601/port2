import { About, Blog, Gallery, Home, Newsletter, Person, Social, Work } from "@/types";
import { Line, Row, Text } from "@once-ui-system/core";

const person: Person = {
  firstName: "Lộc",
  lastName: "Nguyễn Phúc",
  name: "Nguyễn Phúc Lộc",
  role: "Growth Marketer & Performance Specialist",
  avatar: "/falcon mascot.png",
  email: "phucloc.work@gmail.com",
  location: "Asia/Ho_Chi_Minh",
  languages: ["Vietnamese", "English"],
  locale: "en",
};

const newsletter: Newsletter = {
  display: false,
  title: <>Subscribe to {person.firstName}'s Newsletter</>,
  description: <>Growth marketing insights and performance strategies.</>,
};

const social: Social = [
  {
    name: "LinkedIn",
    icon: "linkedin",
    link: "https://www.linkedin.com/in/nguyen-phuc-loc-growth-marketer/",
    essential: true,
  },
  {
    name: "Email",
    icon: "email",
    link: `mailto:${person.email}`,
    essential: true,
  },
];

const home: Home = {
  path: "/",
  image: "/images/og/home.jpg",
  label: "Home",
  title: `${person.name}'s Growth Portfolio`,
  description: `Portfolio website showcasing my work as a ${person.role}`,
  headline: <>Data-Driven Performance & Growth Marketing</>,
  featured: {
    display: true,
    title: (
      <Row gap="12" vertical="center">
        <strong className="ml-4">Performance Lead</strong>{" "}
        <Line background="brand-alpha-strong" vert height="20" />
        <Text marginRight="4" onBackground="brand-medium">
          Azway Travel Growth
        </Text>
      </Row>
    ),
    href: "/work/azway-travel",
  },
  subline: (
    <>
      I'm {person.firstName}, a {person.role.toLowerCase()} based in Hanoi. I design and scale user acquisition funnels, optimize conversions, and build marketing automation workflows.
    </>
  ),
};

const about: About = {
  path: "/about",
  label: "About",
  title: `About – ${person.name}`,
  description: `Meet ${person.name}, ${person.role} from ${person.location}`,
  tableOfContent: {
    display: true,
    subItems: false,
  },
  avatar: {
    display: true,
  },
  calendar: {
    display: false,
    link: "",
  },
  intro: {
    display: true,
    title: "Introduction",
    description: (
      <>
        Nguyen Phuc Loc is a result-oriented Growth Marketer with a strong track record of driving user acquisition, digital performance optimization, and marketing automation. He bridges the gap between marketing creativity and data engineering, leveraging advanced automation (n8n, GTM, GA4) to optimize campaigns and accelerate business growth.
      </>
    ),
  },
  work: {
    display: true,
    title: "Work Experience",
    experiences: [
      {
        company: "Azway Travel",
        timeframe: "Nov 2023 - Present",
        role: "Performance Marketing Lead",
        achievements: [
          <>
            Managed end-to-end growth campaigns across Meta Ads, landing page optimization, lead qualification, and closed-booking tracking.
          </>,
          <>
            Achieved Meta Ads lead metrics: 3.93% CTR (benchmark &gt;2%), 31% lead-to-qualified CVR, and 10.5% qualified-to-booking CVR.
          </>,
          <>
            Designed high-converting landing pages (Sunworld, Team Building, Ha Long Cruise) and coordinated production of multi-format creative assets.
          </>
        ],
        images: [],
      },
      {
        company: "Karofi Holding",
        timeframe: "Apr 2023 - Oct 2023",
        role: "Growth Marketer (User Acquisition & Digital Performance)",
        achievements: [
          <>
            Led user acquisition and performance strategies for smart home appliances, aligning positioning and messaging with target audiences.
          </>,
          <>
            Optimized performance budgets, established automation loops for swift data collection, and generated key customer insights.
          </>
        ],
        images: [],
      },
      {
        company: "Tap Hoa Decor",
        timeframe: "Sep 2022 - Mar 2023",
        role: "E-commerce Growth Project Specialist",
        achievements: [
          <>
            Managed end-to-end paid acquisition funnel to acquire and nurture B2B users for Lark Suite (ByteDance).
          </>,
          <>
            Exceeded Opportunity KPIs by 17-60% over 3 months, with Cost/Opportunity of 300K-400K and demo conversion rates of 33-60%.
          </>
        ],
        images: [],
      },
      {
        company: "Upbase",
        timeframe: "Jun 2022 - Aug 2022",
        role: "Growth Marketing Intern",
        achievements: [
          <>
            Supported digital advertising setup, keyword research, and audience targeting for e-commerce brands.
          </>
        ],
        images: [],
      }
    ],
  },
  studies: {
    display: true,
    title: "Studies & Certifications",
    institutions: [
      {
        name: "National Economics University (NEU)",
        description: <>GPA: 3.77 / 4.0 (8.8 / 10) | Top 5% | Rank: High Distinction</>,
      },
      {
        name: "Professional Certifications",
        description: <>DataCamp Data Analyst, Google Analytics 4 (GA4), Apple Search Ads, Google Ads Apps Certification.</>,
      },
    ],
  },
  technical: {
    display: true,
    title: "Skills & Pillars",
    skills: [
      {
        title: "Performance Marketing & UA",
        description: (
          <>Proven expertise in Meta Ads, Google Ads, TikTok Ads, performance budget management, and funnel optimization.</>
        ),
        tags: [{ name: "Meta Ads" }, { name: "Google Ads" }, { name: "UA" }],
        images: [],
      },
      {
        title: "Data & Automation",
        description: (
          <>Experienced in setting up tracking with GA4 and GTM, developing automation workflows via n8n, and data modeling using SQL and Python.</>
        ),
        tags: [{ name: "n8n" }, { name: "GTM/GA4" }, { name: "SQL/Python" }],
        images: [],
      },
      {
        title: "Human-Centric Growth",
        description: (
          <>Focuses on customer insights, product positioning, landing page conversion rate optimization (CRO), and persuasive copywriting.</>
        ),
        tags: [{ name: "CRO" }, { name: "A/B Testing" }, { name: "Copywriting" }],
        images: [],
      },
    ],
  },
};

const blog: Blog = {
  path: "/blog",
  label: "Blog",
  title: "Growth Case Studies & Proposals",
  description: `Read my detailed growth proposals and case studies`,
};

const work: Work = {
  path: "/work",
  label: "Work",
  title: `Marketing Projects – ${person.name}`,
  description: `Growth marketing and user acquisition projects by ${person.name}`,
};

const gallery: Gallery = {
  path: "/gallery",
  label: "Gallery",
  title: `Media Gallery – ${person.name}`,
  description: `Visual assets, proofs of work, and certifications`,
  images: [
    {
      src: "/nyf 2023.png",
      alt: "NEU Youth Festival 2023",
      orientation: "horizontal",
    },
    {
      src: "/creative assets.png",
      alt: "Azway Travel Creative Assets",
      orientation: "horizontal",
    },
    {
      src: "/n8n fb wf.jpg",
      alt: "n8n Facebook Workflow",
      orientation: "horizontal",
    },
    {
      src: "/n8n dmx wf.jpg",
      alt: "n8n DMX Workflow",
      orientation: "horizontal",
    },
  ],
};

export { person, social, newsletter, home, about, blog, work, gallery };
