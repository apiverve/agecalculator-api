declare module '@apiverve/agecalculator' {
  export interface agecalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface agecalculatorResponse {
    status: string;
    error: string | null;
    data: AgeCalculatorData;
    code?: number;
  }


  interface AgeCalculatorData {
      dob:       Date;
      ageYears:  number;
      ageMonths: number;
      ageWeeks:  number;
      ageDays:   number;
      ageWords:  AgeWords;
  }
  
  interface AgeWords {
      years:   string;
      ordinal: string;
      full:    string;
  }

  export default class agecalculatorWrapper {
    constructor(options: agecalculatorOptions);

    execute(callback: (error: any, data: agecalculatorResponse | null) => void): Promise<agecalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: agecalculatorResponse | null) => void): Promise<agecalculatorResponse>;
    execute(query?: Record<string, any>): Promise<agecalculatorResponse>;
  }
}
