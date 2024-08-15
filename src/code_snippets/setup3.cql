

// ---------------------------------------------  Mathematics THEME  --------------------------------------------- //


// ------------------  Calculus here   ------------------ //
CREATE (n:Subject{
	name:'calculus',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});


CREATE (n:Subject{
	name: 'proofs',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'differentiation',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'integration',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'limits',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
  name: 'Limit Ratio Test',
  subject: 'proofs',
  type: 'topic',
  description: 'The study of limit testing with ratios',
  good: 23,
  alright: 30,
  bad: 0,
  comments: [
    'This topic is well explained but could use more real-world examples.',
    'I found the section on practical applications a bit confusing.',
    'The diagrams were very helpful in understanding the concepts.'
  ],
  suggestions: [
    'Please add a video tutorial for this topic.',
    'It would be great to see more comparison with other limit tests.',
    'Could you also add some youtube videos',
    'Adding a quiz at the end of the topic would help reinforce learning.'
  ],
  learning_objectives: [
    'Understand the fundamental principles of the limit ratio test and its mathematical basis.',
    'Apply the limit ratio test to determine the convergence or divergence of series.',
    'Compare and contrast the limit ratio test with other convergence tests like the root test or integral test.',
    'Analyze and interpret the results of the limit ratio test in the context of real-world problems.',
    'Develop problem-solving skills related to series and limits using the limit ratio test.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['proofs', 'limits'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: "L'Hopitals Rule",
  subject: 'proofs',
  type: 'topic',
  description: 'An essential technique for evaluating limits that result in indeterminate forms, using derivatives to find the limit.',
  good: 73,
  alright: 30,
  bad: 0,
  comments: [
    'Very clear explanation of L\'Hopital\'s Rule with great examples.',
    'The proof section was a bit hard to follow. Could use some simplification.',
    'It would be helpful to have more complex examples that show different cases where L\'Hopital\'s Rule is applicable.'
  ],
  suggestions: [
    'Add interactive graphs to visualize how L\'Hopital\'s Rule works.',
    'Consider linking to video tutorials for visual learners.'
  ],
  learning_objectives: [
    'Understand the conditions under which L\'Hopital\'s Rule can be applied to evaluate limits.',
    'Apply L\'Hopital\'s Rule to solve problems involving indeterminate forms like 0/0 and ∞/∞.',
    'Differentiate between situations that require one application of the rule versus multiple applications.',
    'Demonstrate proficiency in deriving functions to prepare them for the application of L\'Hopital\'s Rule.',
    'Critically analyze and verify the results obtained using L\'Hopital\'s Rule.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['proofs', 'limits', 'differentiation'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
  name: 'Chain Rule',
  subject: 'differentiation',
  type: 'topic',
  description: 'A fundamental technique for differentiating compositions of functions, essential for calculus students.',
  good: 23,
  alright: 50,
  bad: 20,
  comments: [
    'The examples provided make understanding the Chain Rule much easier.',
    'I wish there were more real-life applications shown to see its practical use.',
    'The step-by-step approach is helpful, especially for beginners.'
  ],
  suggestions: [
    'Provide links to online calculators for practice.'
  ],
  learning_objectives: [
    'Understand the mathematical foundation and rationale behind the Chain Rule.',
    'Apply the Chain Rule to compute derivatives of composite functions.',
    'Identify and correct common errors in applying the Chain Rule.',
    "Explore the Chain Rule's applications in physics and engineering for practical insight.",
    'Develop fluency in integrating the Chain Rule with other differentiation rules.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['differentiation'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Interactive tutorial on the Chain Rule',
      'List of practice problems with detailed solutions',
      'Video explanation of the Chain Rule and its applications'
    ];



CREATE (n:Subject{
  name: 'Product Rule',
  subject: 'differentiation',
  type: 'topic',
  description: 'A key differentiation rule used to compute the derivative of the product of two functions, vital for students of calculus.',
  good: 23,
  alright: 60,
  bad: 50,
  comments: [
    'This topic was well presented, especially with the proof included.',
    'Could use some examples with higher degree polynomials.',
    'The visuals were helpful, but adding more could further enhance understanding.'
  ],
  suggestions: [
    'Include interactive examples where users can input their own functions.',
    'Provide a cheat sheet for quick reference to this and other differentiation rules.',
    'Host a webinar or live Q&A session to address common questions about the Product Rule.',
    'I need some questions to answer for this'
  ],
  learning_objectives: [
    'Understand the derivation and proof of the Product Rule.',
    'Apply the Product Rule to differentiate products of polynomial, exponential, and trigonometric functions.',
    'Analyze functions to decide when the Product Rule is needed versus other rules like the Sum Rule.',
    'Develop problem-solving skills by tackling diverse problems that incorporate the Product Rule.',
    'Assess and verify the accuracy of derivatives calculated using the Product Rule.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['differentiation'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Detailed video tutorial on the Product Rule',
      'Set of practice exercises tailored to different difficulty levels',
      'Infographic summarizing the Product Rule and its usage'
    ];



CREATE (n:Subject{
  name: 'Integration by Parts',
  subject: 'integration',
  type: 'topic',
  description: 'A fundamental technique derived from the product rule of differentiation, used to integrate products of functions.',
  good: 23,
  alright: 30,
  bad: 90,
  comments: [
    'Really appreciated the clear steps presented in the tutorial.',
    'More examples with exponential and logarithmic functions would be helpful.',
    'A comparison with other integration techniques in certain scenarios would be useful.'
  ],
  suggestions: [
    'Interactive simulation where students can practice integration by parts.',
    'Include a video series that covers difficult integrals using this technique.',
    'Create a detailed guide on when to use integration by parts versus substitution.'
  ],
  learning_objectives: [
    'Understand the derivation of Integration by Parts from the product rule of differentiation.',
    'Apply Integration by Parts to compute integrals involving products of functions, particularly polynomials and trigonometric functions.',
    'Identify cases where Integration by Parts is more effective than other integration methods.',
    'Develop strategies for selecting the appropriate parts in the formula to simplify integration problems.',
    'Master the technique to solve integrals efficiently and verify their correctness.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Step-by-step guide on Integration by Parts',
      'Video tutorials covering various examples, from basic to complex',
      'Compilation of exercises with solutions for practice'
    ];



CREATE (n:Subject{
  name: 'Functions',
  subject: 'calculus',
  type: 'topic',
  description: 'Exploration of functions, which are special types of relations that assign each input exactly one output.',
  good: 83,
  alright: 30,
  bad: 0,
  comments: [
    'The interactive graphs helped me visualize function behavior effectively.',
    'Could benefit from more real-world application examples to illustrate the importance of functions.'
  ],
  suggestions: [
    'More case studies on how functions are used in engineering and science.',
    'A quiz section to test understanding of function types and their properties.'
  ],
  resources: [
    'Detailed guide on different types of functions and their properties',
    'Interactive applet for exploring the graphical representation of functions',
    'Video lectures on functions in mathematics and their practical applications'
  ],
  learning_objectives: [
    'Define what a function is and explain its importance in mathematics and real-world applications.',
    'Identify different types of functions and their characteristics, including linear, quadratic, and periodic functions.',
    'Apply functions to solve problems in various mathematical contexts and real-life situations.',
    'Analyze the behavior of functions through graphical representations.',
    'Master the application of functions in describing and solving real-world phenomena.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['basic algebra'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Detailed guide on different types of functions and their properties',
      'Interactive applet for exploring the graphical representation of functions',
      'Video lectures on functions in mathematics and their practical applications'
    ];



CREATE (n:Subject{
	name: 'integration preliminaries',
	subject: 'integration',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
  name: 'integrating a constant',
  subject: 'integration preliminaries',
  type: 'topic',
  description: 'Learn how to integrate constants such as 1, 2, e, pi, etc., fundamental for understanding basic integration techniques.',
  good: 23,
  alright: 70,
  bad: 0,
  comments: [
    'Good foundational topic, very straightforward and well explained.'
  ],
  suggestions: [
    'Perhaps add examples integrating over different intervals.'
  ],
  resources: [
    'Video tutorial on integrating constants',
    'Integration exercises with solutions'
  ],
  learning_objectives: [
    'Understand the process of integrating a constant function over an interval.',
    'Apply constant integration to solve practical problems in calculus.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration preliminaries'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Video tutorial on integrating constants',
      'Integration exercises with solutions'
    ];


CREATE (n:Subject{
  name: 'integrating a positive power',
  subject: 'integration preliminaries',
  type: 'topic',
  description: 'Explore how to integrate terms like x, x^2, x^3, essential for mastering polynomial integration.',
  good: 23,
  alright: 30,
  bad: 100,
  comments: [
    'Very helpful for understanding polynomial integrals.'
  ],
  suggestions: [
    'Include more complex polynomials and their integration strategies.'
  ],
  resources: [
    'Step-by-step guide to polynomial integration',
    'Practice problems focusing on polynomial terms'
  ],
  learning_objectives: [
    'Learn the technique of integrating polynomial functions.',
    'Develop skills to integrate higher power polynomials with ease.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration preliminaries'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Step-by-step guide to polynomial integration',
      'Practice problems focusing on polynomial terms'
    ];


CREATE (n:Subject{
  name: 'integrating a negative power',
  subject: 'integration preliminaries',
  type: 'topic',
  description: 'Understand the methods for integrating terms like x^-1, x^-2, which are pivotal for dealing with rational functions.',
  good: 43,
  alright: 30,
  bad: 0,
  comments: [
    'Challenging topic, but explanations were clear.'
  ],
  suggestions: [
    'More examples on integrating functions with negative exponents in denominators would be beneficial.'
  ],
  resources: [
    'Tutorial on rational function integration',
    'Worksheet on negative exponents'
  ],
  learning_objectives: [
    'Master the integration of functions involving negative powers.',
    'Apply integration techniques to rational functions in various contexts.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration preliminaries'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Tutorial on rational function integration',
      'Worksheet on negative exponents'
    ];



CREATE (n:Subject{
  name: 'integrating a fractional power',
  subject: 'integration preliminaries',
  type: 'topic',
  description: 'Learn to integrate terms such as x^0.5, x^3.5, crucial for handling non-integer exponents in calculus.',
  good: 23,
  alright: 456,
  bad: 0,
  comments: [
    'Fascinating extension of polynomial integration to fractional powers.'
  ],
  suggestions: [
    'Include applications in physics and engineering where fractional powers are common.'
  ],
  resources: [
    'Comprehensive guide on fractional power integration',
    'Examples and exercises involving fractional exponents'
  ],
  learning_objectives: [
    'Understand the principles of integrating fractional power functions.',
    'Confidently compute integrals involving fractional exponents.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration preliminaries'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Comprehensive guide on fractional power integration',
      'Examples and exercises involving fractional exponents'
    ];



CREATE (n:Subject{
  name: 'integrating a denominator variable',
  subject: 'integration preliminaries',
  type: 'topic',
  description: 'Focus on integrating terms such as 1/x, essential for logarithmic integration and advanced calculus applications.',
  good: 234,
  alright: 30,
  bad: 0,
  comments: [
    'Essential for understanding the link between logarithmic functions and integration.'
  ],
  suggestions: [
    'More detailed discussion on integrating functions with variables in the denominator.',
    'More examples of use cases for this',
    'I dont fully understand the description of this'
  ],
  resources: [
    'Tutorial on logarithmic integration',
    'Problem sets involving integrals of denominator variables'
  ],
  learning_objectives: [
    'Learn to integrate functions with variables in the denominator.',
    'Develop the ability to apply logarithmic integration in practical scenarios.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration preliminaries'],
    formData.links = ['www.example.com'],
    formData.resources = [
      'Tutorial on logarithmic integration',
      'Problem sets involving integrals of denominator variables'
    ];



CREATE (n:Subject{
  name: 'Lengths, Volumes, and Surfaces',
  subject: 'integration',
  type: 'topic',
  description: 'Introduction to using integration to calculate lengths, areas, volumes, and surface areas, foundational for applications in physics and engineering.',
  good: 23,
  alright: 30,
  bad: 3453,
  comments: [
    "Very applicable to engineering problems I've encountered.",
    'Helpful in visualizing the physical implications of mathematical concepts.'
  ],
  suggestions: [
    'Could benefit from 3D modeling tools to visualize the results better.',
    'More complex examples involving non-standard geometries would be helpful.'
  ],
  resources: [
    'Step-by-step calculation examples of geometrical properties',
    'Interactive tools for visualizing integration in 3D spaces'
  ],
  learning_objectives: [
    'Master the techniques for calculating lengths, areas, volumes, and surface areas through integration.',
    'Apply these techniques to solve real-world problems in science and engineering.',
    'Develop spatial reasoning and mathematical visualization skills.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
  name: 'Integration by Polar Coordinates',
  subject: 'integration',
  type: 'topic',
  description: 'Techniques for integrating functions expressed in polar coordinates, crucial for dealing with circular and spiral forms.',
  good: 23,
  alright: 345,
  bad: 0,
  comments: [
    'Transformed my understanding of integrals in circular and complex domains.',
    'Essential for anyone dealing with fields involving radial symmetry.'
  ],
  suggestions: [
    'Simulations showing the integration process in real time could enhance comprehension.'
  ],
  resources: [
    'Comprehensive guide on polar coordinate integration',
    'Simulations to explore the effects of integrating in polar coordinates'
  ],
  learning_objectives: [
    'Understand the conversion of functions from Cartesian to polar coordinates for integration.',
    'Perform integration over areas and volumes defined in polar coordinates.',
    'Utilize these methods in practical applications involving radial geometries.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
	name: 'sequences and series',
	subject: 'calculus',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
  name: 'Fourier Series',
  subject: 'sequences and series',
  type: 'topic',
  description: 'A mathematical tool used to decompose periodic functions into sums of simpler, sinusoidal functions. Essential for applications in signal processing, physics, and engineering.',
  good: 543,
  alright: 30,
  bad: 0,
  comments: [
    'Invaluable for understanding signal processing and heat equations.',
    'The mathematical depth is challenging but rewarding.'
  ],
  suggestions: [
    'Include more real-world applications in the resources to demonstrate practical utility.',
    'Offer visual animations that show how the Fourier series approximates complex functions over time.'
  ],
  resources: [
    'Detailed guide on the mathematical theory behind Fourier series',
    'Interactive simulation that visualizes the Fourier series approximation',
    'Series of video lectures discussing Fourier series in various contexts, including electrical engineering and acoustics'
  ],
  learning_objectives: [
    'Understand the theoretical foundation of Fourier series, including its derivation and properties.',
    'Apply Fourier series to decompose complex periodic functions into simpler sinusoidal components.',
    'Analyze the convergence criteria of Fourier series and understand its implications in real-world scenarios.',
    'Explore applications of Fourier series in solving practical problems in engineering and physics.',
    'Develop proficiency in using Fourier series in computational tasks and signal analysis.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration', 'differential equations'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
  name: 'Laplace Transformation',
  subject: 'differentiation',
  type: 'topic',
  description: 'A powerful mathematical tool that transforms a time-domain function into a complex frequency-domain representation, integrating concepts from calculus and complex numbers. Widely used in engineering and physics to solve differential equations.',
  good: 23,
  alright: 234,
  bad: 0,
  comments: [
    'This transformation is crucial for understanding control systems and electrical circuits.',
    'Challenging to grasp at first, but extremely useful in practical applications.'
  ],
  suggestions: [
    'Interactive tools to visualize the transformation process would greatly aid in understanding.'
  ],
  resources: [
    'Comprehensive textbook sections explaining the theory and application of Laplace transforms',
    'Web-based calculator for experimenting with different functions and their Laplace transforms',
    'Video tutorials that cover step-by-step methods to solve typical problems using Laplace transforms'
  ],
  learning_objectives: [
    'Understand the fundamental principles of Laplace transforms and their mathematical derivation.',
    'Apply the Laplace transformation to convert complex time-domain functions into simpler frequency-domain forms.',
    'Analyze and solve differential equations using Laplace transforms in various scientific and engineering contexts.',
    'Master the inverse Laplace transform for converting frequency-domain functions back to time-domain functions.',
    'Explore the broader implications of Laplace transforms in systems analysis and signal processing.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration', 'differentiation', 'complex numbers'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
  name: 'Fourier Transform',
  subject: 'differentiation',
  type: 'topic',
  description: 'A mathematical transformation used to convert a time-domain signal into its corresponding frequency-domain representation, employing integral calculus to output a new function that describes frequency content.',
  good: 23,
  alright: 543,
  bad: 0,
  comments: [
    'Essential for analyzing signals in both engineering and physics.',
    'Can be abstract but highly applicable in fields like communications and signal processing.'
  ],
  suggestions: [
    'Would benefit from more practical examples in telecommunications.',
    'Interactive simulations to visualize how the Fourier Transform works would be helpful.'
  ],
  resources: [
    'Comprehensive guide on the mathematical principles of Fourier Transform',
    'Interactive web applets that allow for the visualization and manipulation of signals',
    'Video series explaining the application of Fourier Transform in real-world scenarios'
  ],
  learning_objectives: [
    'Understand the concept of frequency domain and how the Fourier Transform facilitates this transformation.',
    'Apply Fourier Transform to analyze and interpret the frequency components of various signals.',
    'Develop the ability to use Fourier Transform in practical signal processing tasks.',
    'Explore advanced applications of Fourier Transform in modern technologies and scientific research.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
  name: 'Ordinary Differential Equations',
  subject: 'differential equations',
  type: 'topic',
  description: 'Study and solution of equations involving derivatives of functions, focusing on relationships that involve rates of change and the variables over which they are functions.',
  good: 23,
  alright: 30,
  bad: 543,
  comments: [
    'Foundational for understanding dynamic systems in engineering and natural sciences.',
    'Challenging but crucial for any serious student of mathematics or physics.'
  ],
  suggestions: [
    'More examples of nonlinear ODEs and their solutions would be great.',
    'Workshops on solving ODEs using numerical methods could be added.',
    'Can you provide some youtube videos'
  ],
  resources: [
    'Textbook chapters on different types of ordinary differential equations',
    'Online course covering analytical and numerical methods for solving ODEs',
    'Video tutorials focused on practical applications of ODEs in engineering and science'
  ],
  learning_objectives: [
    'Master the fundamental techniques for solving various types of ordinary differential equations.',
    'Apply these techniques to model real-world phenomena in physics, biology, and economics.',
    'Understand the theoretical underpinnings of ODEs and their solutions.',
    'Develop skills in using software tools for the numerical solution of ODEs.',
    'Analyze the stability and behavior of solutions to ODEs in different contexts.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n:Subject{
	name: 'differential equations',
	subject: 'differentiation',
	type: 'subject',
	mainSubject: False
});

CREATE (n1:Subject{
  name: 'First Order Differential Equations',
  subject: 'differential equations',
  type: 'topic',
  description: 'Focuses on solving equations that involve only the first derivative of a function. These are fundamental in modeling systems with a single rate of change.',
  good: 23,
  alright: 30,
  bad: 345,
  comments: ['Essential for any student in engineering or physics.', 'Would appreciate more examples in biological contexts.'],
  suggestions: ['Interactive simulations for dynamic systems modeled by these equations.', 'Workshops on analytical solutions versus numerical methods.'],
  resources: ['Comprehensive guide on first-order differential equations', 'Video tutorials explaining methods of solving linear and nonlinear first-order ODEs'],
  learning_objectives: ['Understand the mathematical formulation of first-order differential equations.', 'Apply methods to solve linear and separable equations in various contexts.', 'Analyze real-world systems using first-order differential equations.']
})
WITH n1
CREATE (formData:FormData)
CREATE (n1)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n2:Subject{
  name: 'Second Order Differential Equations',
  subject: 'differential equations',
  type: 'topic',
  description: 'Deals with equations that include derivatives up to the second level, crucial for understanding phenomena involving accelerations and forces.',
  good: 23,
  alright: 789,
  bad: 0,
  comments: ['Key for mechanical and electrical engineering students.', 'Needs more practical examples especially in oscillations and wave applications.'],
  suggestions: ['Series of problem-solving sessions with focus on mechanical vibrations.', 'Online calculator tools for characteristic equation solutions.'],
  resources: ['Textbook sections on harmonic motion and electrical circuits', 'Series of step-by-step problem-solving videos'],
  learning_objectives: ['Master the characteristic methods for homogeneous equations.', 'Solve non-homogeneous second-order differential equations using various techniques.', 'Apply these equations to physical systems like springs and circuits.']
})
WITH n2
CREATE (formData:FormData)
CREATE (n2)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n3:Subject{
  name: 'Qualitative Analysis',
  subject: 'calculus',
  type: 'topic',
  description: 'Involves the use of heuristics to analyze data, focusing on the interpretation of results rather than exact solutions.',
  good: 23,
  alright: 30,
  bad: 0,
  comments: ['Very applicable to market analysis and economic forecasting.', 'Would benefit from more case studies on data interpretation.'],
  suggestions: ['Interactive data visualization tools.', 'Seminars on statistical methods for qualitative analysis.'],
  resources: ['E-books on data-driven decision making', 'Video courses on qualitative techniques in various industries'],
  learning_objectives: ['Understand various qualitative methods and their applications.', 'Develop skills to interpret complex datasets.', 'Integrate qualitative analysis with quantitative methods for comprehensive insights.']
})
WITH n3
CREATE (formData:FormData)
CREATE (n3)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];



CREATE (n1:Subject{
  name: 'Bifurcations',
  subject: 'calculus',
  type: 'topic',
  description: 'Studies the conditions under which small changes in the parameters of a system cause a qualitative or topological change in its behavior, leading to the splitting into branches.',
  good: 23,
  alright: 23,
  bad: 23,
  comments: [
    'Fascinating topic that connects deeply with both mathematics and physics.',
    'Would be helpful to see more real-world applications like in ecology or economics.'
  ],
  suggestions: [
    'Interactive models to better visualize different types of bifurcations.',
    'Workshops or guest lectures on applying bifurcation theory in scientific research.'
  ],
  resources: [
    'Detailed tutorials on saddle-node and Hopf bifurcations',
    'Case studies on the role of bifurcations in complex systems'
  ],
  learning_objectives: [
    'Understand the mathematical theory behind bifurcations.',
    'Identify different types of bifurcations and their implications in various systems.',
    'Apply bifurcation analysis to study stability and changes in dynamical systems.'
  ]
})
WITH n1
CREATE (formData:FormData)
CREATE (n1)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n2:Subject{
  name: 'Multivariate Calculus',
  subject: 'integration',
  type: 'topic',
  description: 'Explores advanced topics in calculus involving multiple variables, including partial differentiation and multiple integration, essential for fields like engineering, physics, and economics.',
  good: 23,
  alright: 756,
  bad: 0,
  comments: [
    'Core subject for any STEM field student, incredibly useful.',
    'Examples of multivariable optimization would enhance understanding.'
  ],
  suggestions: [
    'Online tools for plotting multivariable functions.',
    'Seminars on the practical applications of multivariate calculus in technology and science.'
  ],
  resources: [
    'Comprehensive guide on partial derivatives and multiple integrals',
    'Video lecture series on vector fields and gradient, divergence, and curl'
  ],
  learning_objectives: [
    'Master the techniques of partial differentiation and multiple integration.',
    'Understand and apply gradient, divergence, and curl in vector calculus.',
    'Utilize multivariate calculus techniques to solve real-world problems in physics, engineering, and beyond.'
  ]
})
WITH n2
CREATE (formData:FormData)
CREATE (n2)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['integration', 'differentiation'],
    formData.links = ['www.example.com'],
    formData.resources = [];



// ------------------   Probability here   ------------------ //

CREATE (n:Subject{
	name:'probability and statistics',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});


CREATE (n1:Subject{
  name: 'mean',
  subject: 'probability and statistics',
  type: 'topic',
  description: 'The study of averages, fundamental in understanding the central tendency of data sets.',
  good: 23,
  alright: 865,
  bad: 0,
  comments: [
    'Essential concept for all fields of statistical analysis.',
    'Would like more examples using real-world data.'
  ],
  suggestions: [
    'Interactive tools to calculate mean for various data sets.',
    'Webinars on statistical means in different contexts.'
  ],
  resources: [
    'Guide on calculating and interpreting the mean.',
    'Video tutorials on mean calculation in Excel and Python.'
  ],
  learning_objectives: [
    'Understand the concept of mean and its calculation.',
    'Apply the mean to summarize data sets in real-world scenarios.',
    'Analyze how the mean compares to other measures of central tendency like median and mode.'
  ]
})
WITH n1
CREATE (formData:FormData)
CREATE (n1)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['probability and statistics'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n2:Subject{
  name: 'variance',
  subject: 'probability and statistics',
  type: 'topic',
  description: 'The study of dispersion, measuring how spread out the numbers are in a data set.',
  good: 345,
  alright: 30,
  bad: 0,
  comments: [
    'Helpful for understanding data variability.',
    'Needs clearer examples for financial and scientific data.'
  ],
  suggestions: [
    'Case studies on variance in stock market analysis.',
    'Detailed guides on variance calculation for different types of data.'
  ],
  resources: [
    'Step-by-step videos on computing variance.',
    'Interactive quizzes to practice variance calculation.'
  ],
  learning_objectives: [
    'Master the calculation of variance.',
    'Apply variance analysis to assess data spread and variability.',
    'Distinguish between population and sample variance.'
  ]
})
WITH n2
CREATE (formData:FormData)
CREATE (n2)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['probability and statistics'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n3:Subject {
  name: 'standard deviation',
  subject: 'probability and statistics',
  type: 'topic',
  description: 'A measure of the amount of variation or dispersion of a set of values, a widely used data variability measure.',
  good: 23,
  alright: 890,
  bad: 0,
  comments: [
    'Crucial for risk assessment in finance.',
    'More applications in quality control would be beneficial.'
  ],
  suggestions: [
    'Workshops on using standard deviation in quality assurance.',
    'Simulation tools to demonstrate effects of standard deviation in process control.'
  ],
  learning_objectives: [
    'Understand the relationship between standard deviation and variance.',
    'Calculate standard deviation for different data sets.',
    'Utilize standard deviation to measure uncertainty and risk in various contexts.'
  ]
})
WITH n3
CREATE (formData:FormData)
CREATE (n3)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['variance'],
    formData.links = ['www.example.com'],
    formData.resources = ['Tutorial on standard deviation and its applications.', 'Case studies illustrating standard deviation in business and science.'];


CREATE (n4:Subject{
  name: 'skewness',
  subject: 'probability and statistics',
  type: 'topic',
  description: 'The study of asymmetry in a statistical distribution, a crucial measure to understand the distribution\'s shape.',
  good: 23,
  alright: 345,
  bad: 0,
  comments: [
    'Important for data distribution analysis.',
    'Examples from psychology and health sciences are needed.'
  ],
  suggestions: [
    'Visual tools to demonstrate skewness in different distributions.',
    'Training on interpreting skewness results.'
  ],
  resources: [
    'Videos explaining skewness and its calculation.',
    'Interactive modules to explore the effects of skewness on statistical interpretation.'
  ],
  learning_objectives: [
    'Comprehend skewness and its implications.',
    'Analyze and interpret skewness in real data sets.',
    'Correlate skewness with real-world phenomena and its impact on averages and other statistics.'
  ]
})
WITH n4
CREATE (formData:FormData)
CREATE (n4)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['probability and statistics'],
    formData.links = ['www.example.com'],
    formData.resources = n4.resources;



CREATE (n5:Subject{
  name: 'moment generating function',
  subject: 'probability and statistics',
  type: 'topic',
  description: 'A mathematical function that summarizes all moments of a probability distribution, used to derive mean, variance, standard deviation, and skewness.',
  good: 453,
  alright: 30,
  bad: 0,
  comments: [
    'Complex but incredibly powerful tool for statistical analysis.',
    'Would be helpful to include software implementation examples.'
  ],
  suggestions: [
    'Workshops on practical applications using moment generating functions.',
    'Integration of software tools like R and Python in tutorials.'
  ],
  resources: [
    'Comprehensive guides on the theory and use of moment generating functions.',
    'Software tutorials for implementing moment generating functions in statistical calculations.'
  ],
  learning_objectives: [
    'Understand the definition and properties of moment generating functions.',
    'Utilize moment generating functions to compute moments of distributions.',
    'Explore the applications of moment generating functions in statistical analysis and risk assessment.'
  ]
})
WITH n5
CREATE (formData:FormData)
CREATE (n5)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['probability and statistics', 'mean', 'standard deviation', 'skewness'],
    formData.links = ['www.example.com'],
    formData.resources = [];




// ------------------  Linear Algebra here   ------------------ //
CREATE (n:Subject{
	name: 'linear algebra',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});

CREATE (n:Subject{
	name: 'vector spaces',
	subject: 'linear algebra',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'linear transformations',
	subject: 'linear algebra',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'matrix theory',
	subject: 'linear algebra',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
  name: 'Eigenvalues and Eigenvectors',
  subject: 'matrix theory',
  type: 'topic',
  description: 'Fundamental concepts in matrix theory, critical for understanding many applications of linear algebra.',
  good: 78,
  alright: 76,
  bad: 0,
  comments: [
    'The explanations are clear and the visual aids are very helpful.',
    'A deeper dive into applications in computer science would be beneficial.',
    'The step-by-step approach to finding eigenvalues and eigenvectors is very effective.'
  ],
  suggestions: [
    'Include more real-world applications to illustrate their importance.',
    'Add interactive tools to visualize eigenvectors and eigenvalues.',
    'Provide a summary sheet for quick reference.'
  ],
  resources: [
    'Interactive eigenvector and eigenvalue calculator',
    'Problem sets with detailed solutions',
    'Video tutorials on eigenvalues and eigenvectors'
  ],
  learning_objectives: [
    'Understand the definition and properties of eigenvalues and eigenvectors.',
    'Learn methods for calculating eigenvalues and eigenvectors of a matrix.',
    'Explore applications of eigenvalues and eigenvectors in various fields.',
    'Develop skills to solve practical problems involving eigenvalues and eigenvectors.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['matrix theory'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'Determinants',
  subject: 'matrix theory',
  type: 'topic',
  description: 'A key concept in matrix theory, used to determine the solvability of a system of linear equations.',
  good: 23,
  alright: 76,
  bad: 0,
  comments: [
    'The proof of properties of determinants is very well explained.',
    'Could use more examples with larger matrices.',
    'The section on applications in physics is particularly useful.'
  ],
  suggestions: [
    'Add more interactive examples.',
    'Provide a detailed cheat sheet on properties and applications of determinants.',
    'Offer a live Q&A session for further clarification.'
  ],
  resources: [
    'Step-by-step guide to calculating determinants',
    'Practice problems of varying difficulty',
    'Video explanation of determinant properties and their applications'
  ],
  learning_objectives: [
    'Understand the concept and properties of determinants.',
    'Apply determinants to solve systems of linear equations.',
    'Explore the use of determinants in different mathematical and practical contexts.',
    'Develop proficiency in calculating determinants of matrices.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['matrix theory'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'Inner Product Spaces',
  subject: 'vector spaces',
  type: 'topic',
  description: 'An introduction to inner product spaces, essential for advanced studies in linear algebra and its applications.',
  good: 23,
  alright: 54,
  bad: 0,
  comments: [
    'Great introduction to inner product spaces with clear examples.',
    'Would appreciate more real-life applications.',
    'The geometric interpretation section is very helpful.'
  ],
  suggestions: [
    'Include more visual aids to illustrate concepts.',
    'Add examples related to computer graphics and data science.',
    'Provide an interactive tool for exploring inner product spaces.'
  ],
  resources: [
    'Interactive visualizations of inner product spaces',
    'Examples and exercises with detailed solutions',
    'Video lectures on inner product spaces and their properties'
  ],
  learning_objectives: [
    'Understand the definition and properties of inner product spaces.',
    'Apply inner product concepts to solve practical problems.',
    'Explore the geometric interpretation and applications of inner product spaces.',
    'Develop skills in manipulating and working within inner product spaces.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['vector spaces'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'basis and dimension',
  subject: 'vector spaces',
  type: 'topic',
  description: 'Understanding the basis of a vector space and its dimension, foundational concepts in linear algebra.',
  good: 23,
  alright: 30,
  bad: 54,
  comments: [
    'Excellent coverage of basis and dimension with intuitive examples.',
    'The applications to various fields are very insightful.'
  ],
  suggestions: [
    'Include more challenging problems to deepen understanding.',
    'Provide additional resources for further reading.'
  ],
  resources: [
    'Comprehensive guide to basis and dimension',
    'Practice problems with step-by-step solutions',
    'Video tutorials on basis and dimension'
  ],
  learning_objectives: [
    'Understand the concepts of basis and dimension in vector spaces.',
    'Learn methods to find the basis and dimension of a given vector space.',
    'Explore applications of these concepts in different fields of study.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['vector spaces'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'linear operators',
  subject: 'linear transformations',
  type: 'topic',
  description: 'An in-depth look at linear operators, their properties, and applications in linear algebra.',
  good: 23,
  alright: 65,
  bad: 0,
  comments: [
    "The section on the application of linear operators in quantum mechanics is fascinating.",
    'Clear and concise explanation of properties and examples.'
  ],
  suggestions: [
    'Provide more examples related to computer science and data analysis.',
    'Include more visual aids to enhance understanding.'
  ],
  resources: [
    'Detailed explanation and examples of linear operators',
    'Interactive tools to explore properties of linear operators',
    'Video lectures on linear operators and their applications'
  ],
  learning_objectives: [
    'Understand the definition and properties of linear operators.',
    'Apply linear operators to solve practical problems.',
    'Explore applications of linear operators in various fields, including quantum mechanics and data science.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['linear transformations'],
    formData.links = ['www.example.com'],
    formData.resources = [];


// ------------------  Algebra here   ------------------ //
CREATE (n:Subject{
	name: 'algebra',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});

CREATE (n:Subject{
	name: 'basic algebra',
	subject: 'algebra',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'abstract algebra',
	subject: 'algebra',
	type: 'subject',
	mainSubject: False
});


CREATE (n:Subject{
  name: 'polynomial equations',
  subject: 'basic algebra',
  type: 'topic',
  description: 'Study of polynomial equations, including methods for solving and analyzing their properties.',
  good: 45,
  alright: 30,
  bad: 0,
  comments: [
    'Clear and concise explanation of solving polynomial equations.',
    'Examples provided are very helpful for understanding.'
  ],
  suggestions: [
    'Include more complex examples to challenge advanced students.',
    'Provide interactive tools for practicing polynomial equation solving.'
  ],
  resources: [
    'Step-by-step guide to solving polynomial equations',
    'Practice problems with detailed solutions',
    'Video tutorials on polynomial equations and their properties'
  ],
  learning_objectives: [
    'Understand the properties of polynomial equations.',
    'Learn methods for solving polynomial equations.',
    'Explore applications of polynomial equations in various fields.',
    'Develop problem-solving skills through practice problems.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['basic algebra'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'group theory',
  subject: 'abstract algebra',
  type: 'topic',
  description: 'Introduction to group theory, a fundamental area in abstract algebra.',
  good: 45,
  alright: 30,
  bad: 0,
  comments: [
    'Excellent introduction to group theory concepts.',
    'Would benefit from more real-world applications.'
  ],
  suggestions: [
    'Include interactive visualizations of group operations.',
    'Provide additional examples related to symmetry and physics.'
  ],
  resources: [
    'Interactive group operation explorer',
    'Examples and exercises with detailed solutions',
    'Video lectures on group theory and its applications'
  ],
  learning_objectives: [
    'Understand the definition and properties of groups.',
    'Learn about different types of groups and their applications.',
    'Explore real-world applications of group theory in various fields.',
    'Develop skills in working with groups and solving related problems.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['abstract algebra'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'ring theory',
  subject: 'abstract algebra',
  type: 'topic',
  description: 'Study of rings, another key concept in abstract algebra, focusing on their properties and applications.',
  good: 23,
  alright: 30,
  bad: 65,
  comments: [
    'Comprehensive coverage of ring theory.',
    'Examples provided are very clear and helpful.'
  ],
  suggestions: [
    'Include more complex examples and applications.',
    'Provide interactive tools for exploring ring properties.'
  ],
  resources: [
    'Detailed explanation and examples of ring theory',
    'Practice problems with solutions',
    'Video tutorials on ring theory and its applications'
  ],
  learning_objectives: [
    'Understand the definition and properties of rings.',
    'Learn methods for working with rings and solving related problems.',
    'Explore applications of ring theory in different fields.',
    'Develop proficiency in manipulating and understanding rings.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['abstract algebra'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'field theory',
  subject: 'abstract algebra',
  type: 'topic',
  description: 'Introduction to field theory, including the study of fields and their properties.',
  good: 23,
  alright: 34,
  bad: 0,
  comments: [
    'Great introduction to field theory with clear examples.',
    'Would love to see more real-world applications discussed.'
  ],
  suggestions: [
    'Include more visual aids to illustrate concepts.',
    'Provide additional resources for further reading.'
  ],
  resources: [
    'Comprehensive guide to field theory',
    'Practice problems with step-by-step solutions',
    'Video tutorials on field theory'
  ],
  learning_objectives: [
    'Understand the definition and properties of fields.',
    'Learn methods for working with fields and solving related problems.',
    'Explore applications of field theory in different fields of study.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['abstract algebra'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'linear equations',
  subject: 'linear algebra',
  type: 'topic',
  description: 'Study of linear equations, including methods for solving systems of linear equations.',
  good: 43,
  alright: 30,
  bad: 0,
  comments: [
    "The methods for solving linear equations are well explained.",
    'The section on applications in economics and engineering is very useful.'
  ],
  suggestions: [
    'Include more challenging problems to deepen understanding.',
    'Provide additional resources for further reading.'
  ],
  resources: [
    'Comprehensive guide to solving linear equations',
    'Practice problems with step-by-step solutions',
    'Video tutorials on linear equations and their applications'
  ],
  learning_objectives: [
    'Understand the properties of linear equations.',
    'Learn methods for solving systems of linear equations.',
    'Explore applications of linear equations in various fields.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['linear algebra'],
    formData.links = ['www.example.com'],
    formData.resources = [];



// ------------------  Discrete Mathematics here   ------------------ //
CREATE (n:Subject{
	name: 'discrete mathematics',
	type: 'subject',
	theme: 'Mathematics',
	mainSubject: True
});

CREATE (n:Subject{
	name: 'graph theory',
	subject: 'discrete mathematics',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'combinatorics',
	subject: 'discrete mathematics',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
	name: 'logic',
	subject: 'discrete mathematics',
	type: 'subject',
	mainSubject: False
});

CREATE (n:Subject{
  name: 'Graph Connectivity',
  subject: 'graph theory',
  type: 'topic',
  description: 'Study of connectivity in graphs, including algorithms for determining connectivity and its applications.',
  good: 23,
  alright: 30,
  bad: 32,
  comments: [
    'Clear explanation of graph connectivity algorithms.',
    'The section on applications in computer networks is very insightful.'
  ],
  suggestions: [
    'Include more visual aids to illustrate concepts.',
    'Provide additional resources for further exploration.'
  ],
  resources: [
    'Detailed explanation of graph connectivity algorithms',
    'Practice problems with solutions',
    'Video tutorials on graph connectivity and its applications'
  ],
  learning_objectives: [
    'Understand the concept of graph connectivity.',
    'Learn algorithms for determining connectivity in graphs.',
    'Explore applications of graph connectivity in various fields.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['graph theory'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'Permutations and Combinations',
  subject: 'combinatorics',
  type: 'topic',
  description: 'Study of permutations and combinations, including methods for counting and generating them.',
  good: 23,
  alright: 30,
  bad: 56,
  comments: [
    'Excellent coverage of permutations and combinations.',
    'The examples provided are very helpful for understanding.'
  ],
  suggestions: [
    'Include more challenging problems to deepen understanding.',
    'Provide additional resources for further exploration.'
  ],
  resources: [
    'Comprehensive guide to permutations and combinations',
    'Practice problems with step-by-step solutions',
    'Video tutorials on permutations, combinations, and their applications'
  ],
  learning_objectives: [
    'Understand the concept of permutations and combinations.',
    'Learn methods for counting and generating permutations and combinations.',
    'Explore applications of permutations and combinations in various fields.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['combinatorics'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'Propositional Logic',
  subject: 'logic',
  type: 'topic',
  description: 'Introduction to propositional logic, including truth tables, logical equivalences, and applications.',
  good: 23,
  alright: 30,
  bad: 43,
  comments: [
    'Clear explanation of propositional logic concepts.',
    'The section on logical equivalences is very well done.'
  ],
  suggestions: [
    'Include more real-world applications to motivate learning.',
    'Provide interactive exercises for practice.'
  ],
  resources: [
    'Detailed explanation of propositional logic concepts',
    'Practice problems with solutions',
    'Video tutorials on propositional logic and its applications'
  ],
  learning_objectives: [
    'Understand the basic concepts of propositional logic.',
    'Learn methods for analyzing and simplifying propositional expressions.',
    'Explore applications of propositional logic in computer science and mathematics.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['logic'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'Set Theory',
  subject: 'logic',
  type: 'topic',
  description: 'Study of sets and their properties, including set operations, relations, and functions.',
  good: 23,
  alright: 30,
  bad: 67,
  comments: [
    'Clear explanation of set theory concepts.',
    'The section on set operations is particularly helpful.'
  ],
  suggestions: [
    'Include more advanced topics like cardinality and transfinite numbers.',
    'Provide interactive exercises for practice.'
  ],
  resources: [
    'Comprehensive guide to set theory concepts',
    'Practice problems with step-by-step solutions',
    'Video tutorials on set theory and its applications'
  ],
  learning_objectives: [
    'Understand the basic concepts of set theory.',
    'Learn methods for working with sets, relations, and functions.',
    'Explore applications of set theory in various fields.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['logic'],
    formData.links = ['www.example.com'],
    formData.resources = [];


CREATE (n:Subject{
  name: 'Shortest Path Algorithms',
  subject: 'graph theory',
  type: 'topic',
  description: 'Study of algorithms for finding the shortest paths in graphs, including Dijkstra\'s algorithm and Floyd-Warshall algorithm.',
  good: 23,
  alright: 43,
  bad: 0,
  comments: [
    'Clear explanation of shortest path algorithms.',
    'The examples provided are very helpful for understanding.'
  ],
  suggestions: [
    'Include more real-world applications to motivate learning.',
    'Provide interactive exercises for practice.'
  ],
  resources: [
    'Detailed explanation of shortest path algorithms',
    'Practice problems with solutions',
    'Video tutorials on shortest path algorithms and their applications'
  ],
  learning_objectives: [
    'Understand the concept of shortest paths in graphs.',
    'Learn algorithms for finding shortest paths, including Dijkstra\'s algorithm and Floyd-Warshall algorithm.',
    'Explore applications of shortest path algorithms in various fields.'
  ]
})
WITH n
CREATE (formData:FormData)
CREATE (n)-[:HAS_FORM_DATA]->(formData)
SET formData.requires = ['graph theory'],
    formData.links = ['www.example.com'],
    formData.resources = [];



// -------------------------------------------------- RELATIONSHIPS HERE -------------------------------------------------- //



// Grouped these by page
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'Functions'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'Qualitative Analysis'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'Bifurcations'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'sequences and series'})
CREATE (title) - [:IS_USED_IN{order: 4}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'proofs'})
CREATE (title) - [:IS_USED_IN{order: 5}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'limits'})
CREATE (title) - [:IS_USED_IN{order: 6}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'differentiation'})
CREATE (title) - [:IS_USED_IN{order: 7}] -> (subject);
MATCH (title:Subject{name: 'calculus'}), (subject:Subject{name:'integration'})
CREATE (title) - [:IS_USED_IN{order: 8}] -> (subject);



MATCH (title:Subject{name: 'limits'}), (subject:Subject{name:'L\'Hopital\'s Rule'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'limits'}), (subject:Subject{name:'Limit Ratio Test'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);

MATCH (title:Subject{name: 'proofs'}), (subject:Subject{name:"L'Hopitals Rule"})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'proofs'}), (subject:Subject{name:'Limit Ratio Test'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);



MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'Integration by Parts'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'integration preliminaries'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'Lengths, Volumes, and Surfaces'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);
MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'Integration by Polar Coordinates'})
CREATE (title) - [:IS_USED_IN{order: 4}] -> (subject);
MATCH (title:Subject{name: 'integration'}), (subject:Subject{name:'Multivariate Calculus'})
CREATE (title) - [:IS_USED_IN{order: 5}] -> (subject);



MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a constant'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a positive power'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a negative power'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);
MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a fractional power'})
CREATE (title) - [:IS_USED_IN{order: 4}] -> (subject);
MATCH (title:Subject{name: 'integration preliminaries'}), (subject:Subject{name:'integrating a denominator variable'})
CREATE (title) - [:IS_USED_IN{order: 5}] -> (subject);




MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'Product Rule'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'Chain Rule'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'L\'Hopital\'s Rule'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'Laplace Transformation'})
CREATE (title) - [:IS_USED_IN{order: 4}] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'Fourier Transform'})
CREATE (title) - [:IS_USED_IN{order: 5}] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'differential equations'})
CREATE (title) - [:IS_USED_IN{order: 6}] -> (subject);
MATCH (title:Subject{name: 'differentiation'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN{order: 7}] -> (subject);



MATCH (title:Subject{name: 'differential equations'}), (subject:Subject{name:'Ordinary Differential Equations'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'differential equations'}), (subject:Subject{name:'First Order Differential Equations'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'differential equations'}), (subject:Subject{name:'Second Order Differential Equations'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);



MATCH (title:Subject{name: 'sequences and series'}), (subject:Subject{name:'Fourier Series'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);



MATCH (title:Subject{name: 'probability and statistics'}), (subject:Subject{name:'mean'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'probability and statistics'}), (subject:Subject{name:'variance'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'probability and statistics'}), (subject:Subject{name:'skewness'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);
MATCH (title:Subject{name: 'variance'}), (subject:Subject{name:'standard deviation'})
CREATE (title) - [:IS_USED_IN{order: 4}] -> (subject);
MATCH (title:Subject{name: 'mean'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN{order: 5}] -> (subject);
MATCH (title:Subject{name: 'standard deviation'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN{order: 6}] -> (subject);
MATCH (title:Subject{name: 'skewness'}), (subject:Subject{name:'moment generating function'})
CREATE (title) - [:IS_USED_IN{order: 7}] -> (subject);




MATCH (title:Subject{name: 'linear algebra'}), (subject:Subject{name:'vector spaces'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'linear algebra'}), (subject:Subject{name:'linear transformations'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'linear algebra'}), (subject:Subject{name:'matrix theory'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);
MATCH (title:Subject{name: 'linear algebra'}), (subject:Subject{name:'linear equations'})
CREATE (title) - [:IS_USED_IN{order: 4}] -> (subject);



MATCH (title:Subject{name: 'vector spaces'}), (subject:Subject{name:'basis and dimension'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'vector spaces'}), (subject:Subject{name:'Inner Product Spaces'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);



MATCH (title:Subject{name: 'matrix theory'}), (subject:Subject{name:'Eigenvalues and Eigenvectors'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'matrix theory'}), (subject:Subject{name:'Determinants'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);



MATCH (title:Subject{name: 'linear transformations'}), (subject:Subject{name:'linear operators'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);



MATCH (title:Subject{name: 'algebra'}), (subject:Subject{name:'basic algebra'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'algebra'}), (subject:Subject{name:'abstract algebra'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'algebra'}), (subject:Subject{name:'linear algebra'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);



MATCH (title:Subject{name: 'basic algebra'}), (subject:Subject{name:'polynomial equations'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);



MATCH (title:Subject{name: 'abstract algebra'}), (subject:Subject{name:'group theory'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'abstract algebra'}), (subject:Subject{name:'ring theory'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'abstract algebra'}), (subject:Subject{name:'field theory'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);



MATCH (title:Subject{name: 'discrete mathematics'}), (subject:Subject{name:'graph theory'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'discrete mathematics'}), (subject:Subject{name:'combinatorics'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);
MATCH (title:Subject{name: 'discrete mathematics'}), (subject:Subject{name:'logic'})
CREATE (title) - [:IS_USED_IN{order: 3}] -> (subject);



MATCH (title:Subject{name: 'graph theory'}), (subject:Subject{name:'Graph Connectivity'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'graph theory'}), (subject:Subject{name:'Shortest Path Algorithms'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject);



MATCH (title:Subject{name: 'combinatorics'}), (subject:Subject{name:'Permutations and Combinations'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);



MATCH (title:Subject{name: 'logic'}), (subject:Subject{name:'Propositional Logic'})
CREATE (title) - [:IS_USED_IN{order: 1}] -> (subject);
MATCH (title:Subject{name: 'logic'}), (subject:Subject{name:'Set Theory'})
CREATE (title) - [:IS_USED_IN{order: 2}] -> (subject)


